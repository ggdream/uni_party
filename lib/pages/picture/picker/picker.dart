import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
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
  final Set<String> _selectedSet = {};
  int _currentPages = _pageCounter;

  static const int _pageCounter = 16;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    this._getAllImagesFromAlbum();
    _controller.addListener(_scrollListener);
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
      controller: _controller,
      itemCount:
          _currentPages > _imageList.length ? _imageList.length : _currentPages,
      itemBuilder: _itemBuilder,
    );
  }

  void _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent) {
      if (_imageList.isEmpty) return;

      setState(() {
        _currentPages += _pageCounter;
      });
    }
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
              child: Image.file(File(idx), fit: BoxFit.cover),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    if (_selectedSet.contains(idx)) {
                      _selectedSet.remove(idx);
                    } else {
                      _selectedSet.add(idx);
                    }
                  });
                },
                child: Icon(
                  _selectedSet.contains(idx)
                      ? CupertinoIcons.check_mark_circled_solid
                      : CupertinoIcons.check_mark_circled,
                  color:
                      _selectedSet.contains(idx) ? ColorsX.green : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PicturePickerController {}

class PicturePickerPage extends StatefulWidget {
  const PicturePickerPage({Key? key}) : super(key: key);

  @override
  _PicturePickerPageState createState() => _PicturePickerPageState();
}

class _PicturePickerPageState extends State<PicturePickerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: BackBtn(),
      ),
      body: PicturePickerView(
        controller: PicturePickerController(),
      ),
    );
  }
}
