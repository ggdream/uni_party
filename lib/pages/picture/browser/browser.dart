import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

import 'package:uni_party/styles/styles.dart';
import 'package:uni_party/widgets/button/button.dart';

import 'controller.dart';

class PictureBrowserPage extends StatelessWidget {
  PictureBrowserPage({
    Key? key,
  }) : super(key: key);
  final _controller = Get.put(
    BrowserController(
      pid: Get.parameters['p'],
      initialPage: int.parse(Get.parameters['offset'] ?? "0"),
    ),
  );
  @override
  Widget build(BuildContext context) {
    _controller.images.addAll(Get.arguments);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(),
      body: bodyView(),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: BackBtn(),
      title: Text('查看图片'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: _controller.onSwitchWatchMode,
          icon: Icon(CupertinoIcons.switch_camera_solid),
        ),
        IconButton(
          onPressed: _controller.saveImage,
          icon: Icon(Icons.cloud_download_rounded),
        ),
      ],
    );
  }

  Widget bodyView() {
    return Obx(
      () => _controller.waterMode.value
          ? waterfallView()
          : simpleBigView(),
    );
  }

  Widget simpleBigView() {
    return PhotoViewGallery.builder(
      enableRotation: true,
      scrollPhysics: ScrollX.physics,
      pageController: _controller.controller,
      onPageChanged: _controller.onPageChanged,
      itemCount: _controller.images.length,
      builder: (BuildContext context, int index) {
        print(_controller.initialPage);
        return PhotoViewGalleryPageOptions(
          imageProvider: NetworkImage(_controller.images[index]),
          initialScale: PhotoViewComputedScale.contained * 0.8,
          heroAttributes: PhotoViewHeroAttributes(
            tag: _controller.images[index].hashCode,
          ),
        );
      },
      loadingBuilder: (context, event) => Center(
        child: Container(
          width: 36,
          height: 36,
          child: CircularProgressIndicator(
            value: event == null
                ? 0
                : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
          ),
        ),
      ),
      backgroundDecoration: BoxDecoration(
        color: Colors.black,
      ),
    );
  }

  Widget waterfallView() {
    return WaterfallFlow.builder(
      padding: MP.screenAll,
      gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemCount: _controller.images.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(_controller.images[index]),
        );
      },
    );
  }
}
