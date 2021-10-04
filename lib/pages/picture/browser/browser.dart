import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'package:uni_party/styles/styles.dart';
import 'package:uni_party/widgets/button/button.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

import 'controller.dart';

class PictureBrowserPage extends StatelessWidget {
  PictureBrowserPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(
      BrowserController(
        pid: Get.parameters['p'],
        initialPage: int.parse(Get.parameters['offset'] ?? "0"),
      ),
    );

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
          onPressed: BrowserController.to.onSwitchWatchMode,
          icon: Icon(CupertinoIcons.switch_camera_solid),
        ),
        IconButton(
          onPressed: BrowserController.to.saveImage,
          icon: Icon(Icons.cloud_download_rounded),
        ),
      ],
    );
  }

  Widget bodyView() {
    return Obx(
      () => BrowserController.to.waterMode.value
          ? waterfallView()
          : simpleBigView(),
    );
  }

  Widget simpleBigView() {
    return PhotoViewGallery.builder(
      enableRotation: true,
      scrollPhysics: ScrollX.physics,
      pageController: BrowserController.to.controller,
      onPageChanged: BrowserController.to.onPageChanged,
      itemCount: BrowserController.to.images.length,
      builder: (BuildContext context, int index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: NetworkImage(BrowserController.to.images[index]),
          initialScale: PhotoViewComputedScale.contained * 0.8,
          heroAttributes: PhotoViewHeroAttributes(
            tag: BrowserController.to.images[index].hashCode,
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
      itemCount: BrowserController.to.images.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(BrowserController.to.images[index]),
        );
      },
    );
  }
}
