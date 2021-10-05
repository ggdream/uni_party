import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:suit/suit.dart';

import 'package:uni_party/router/router.dart';
import 'package:uni_party/styles/styles.dart';
import 'package:uni_party/widgets/button/button.dart';

export 'preview.dart';

class PicturePickerView extends StatefulWidget {
  const PicturePickerView({
    Key? key,
    required this.controller,
    this.onSelected,
    this.crossAxisCount = 2,
  }) : super(key: key);

  final PicturePickerController controller;
  final void Function(List<String>?)? onSelected;

  final int crossAxisCount;

  @override
  _PicturePickerViewState createState() => _PicturePickerViewState();
}

class _PicturePickerViewState extends State<PicturePickerView> {
  final List<String> _imageList = [];
  final List<String> _selectedSet = [];

  @override
  void initState() {
    super.initState();
    this._getAllImagesFromAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: _imageList.length,
      itemBuilder: _itemBuilder,
    );
  }

  Future<void> _getAllImagesFromAlbum() async {
    final result = await PhotoManager.getAssetPathList();
    AssetPathEntity? entity;
    for (var item in result) {
      if (item.isAll) {
        entity = item;
        break;
      }
    }

    if (entity == null) return;
    final entities = await entity.getAssetListRange(
      start: 0,
      end: entity.assetCount - 1,
    );

    List<String> images = [];
    for (var entity in entities) {
      if (entity.type == AssetType.image) {
        final title = await entity.titleAsync;
        _imageList.add('${entity.relativePath}/$title');
      }
    }

    setState(() {
      _imageList.addAll(images);
    });
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final idx = _imageList[index];
    return GestureDetector(
      onTap: () async {
        await Get.toNamed(RoutesNamespace.PicturePreview, arguments: idx);
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox.expand(
              child: Image.file(
                File(idx),
                fit: BoxFit.cover,
                cacheWidth: 50.vw.toInt(),
              ),
            ),
          ),
          _selectMarkWidget(idx),
        ],
      ),
    );
  }

  Widget _selectMarkWidget(String idx) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        icon: Icon(
          _selectedSet.contains(idx)
              ? CupertinoIcons.check_mark_circled_solid
              : CupertinoIcons.check_mark_circled,
          color: _selectedSet.contains(idx) ? ColorsX.green : Colors.black,
        ),
        onPressed: () {
          setState(() {
            if (_selectedSet.contains(idx)) {
              _selectedSet.remove(idx);
              widget.controller.delImage(idx);
            } else {
              _selectedSet.add(idx);
              widget.controller.addImage(idx);
            }
          });
        },
      ),
    );
  }
}

class PicturePickerController {
  List<String> _selectedList = [];

  void addImage(String image) {
    if (!(_selectedList.contains(image))) {
      _selectedList.add(image);
    }
  }

  void delImage(String image) {
    if (_selectedList.contains(image)) {
      _selectedList.remove(image);
    }
  }

  List<String> get images => _selectedList;
}

class PicturePickerPage extends StatelessWidget {
  PicturePickerPage({Key? key}) : super(key: key);

  final PicturePickerController _controller = PicturePickerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(context),
      body: PicturePickerView(
        controller: _controller,
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      leading: BackBtn(),
      title: Text('选择本地图片'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop(_controller.images);
          },
          icon: Icon(CupertinoIcons.checkmark_seal_fill),
        ),
      ],
    );
  }
}
