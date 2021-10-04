import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

import 'package:uni_party/styles/styles.dart';
import 'package:uni_party/widgets/button/button.dart';

import 'controller.dart';

class PicturePublishPage extends StatelessWidget {
  PicturePublishPage({Key? key}) : super(key: key);

  final _node1 = FocusNode();
  final _node2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    Get.put(PublishController());

    return Scaffold(
      appBar: _AppBar(),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          _node1.unfocus();
          _node2.unfocus();
        },
        child: Padding(
          padding: MP.screenAll,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textInputView(),
              tagsInputView(),
              tagsShowView(),
              SizedBox(height: 48),
              imagesShowView(),
            ],
          ),
        ),
      ),
      floatingActionButton: floatingBtns(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }

  Widget imagesShowView() {
    return Obx(
      () => Expanded(
        child: GridView.builder(
          physics: ScrollX.physics,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: PublishController.to.images.length,
          itemBuilder: (context, index) {
            return imageCard(index);
          },
        ),
      ),
    );
  }

  Widget imageCard(int index) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.file(
            File(PublishController.to.images[index]),
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: () {},
            child: Icon(
              Icons.cancel_rounded,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget tagsShowView() {
    return Wrap(
      children: [
        RawChip(
          label: Text('data'),
          deleteIcon: Icon(Icons.cancel_rounded),
          onDeleted: () {},
        ),
      ],
    );
  }

  Widget tagsInputView() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            focusNode: _node2,
            decoration: InputDecoration(
              hintText: '请输入标签（1个至6个）',
              filled: true,
              fillColor: ColorsX.greyLight,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              enabledBorder: outlineInputBorder,
              focusedBorder: outlineInputBorder,
            ),
            maxLength: 8,
          ),
        ),
        SizedBox(width: 12),
        ElevatedButton(
          onPressed: () {},
          child: Text('添加'),
        ),
      ],
    );
  }

  Widget textInputView() {
    return TextField(
      focusNode: _node1,
      decoration: InputDecoration(
        hintText: '请输入标题',
        filled: true,
        fillColor: ColorsX.greyLight,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
      ),
      maxLength: 64,
    );
  }

  Padding floatingBtns() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () async {},
            child: Icon(Icons.photo_camera_rounded),
            heroTag: 'camrea',
          ),
          SizedBox(width: 24),
          FloatingActionButton(
            onPressed: () async {
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
                end: entity.assetCount == 0 ? 0 : entity.assetCount - 1,
              );

              List<String> images = [];
              for (var entity in entities) {
                if (entity.type == AssetType.image) {
                  final title = await entity.titleAsync;
                  images.add('${entity.relativePath}/$title');
                }
              }

              PublishController.to.images.clear();
              PublishController.to.images.addAll(images);
            },
            child: Icon(Icons.photo_rounded),
            heroTag: 'library',
          ),
        ],
      ),
    );
  }

  final outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(32),
    borderSide: BorderSide.none,
  );
}

class _AppBar extends StatelessWidget with PreferredSizeWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BackBtn(),
      title: Text('发布写真'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.cloud_done_rounded),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
