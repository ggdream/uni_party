import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'package:uni_party/styles/styles.dart';
import 'package:uni_party/widgets/button/button.dart';

import 'controller.dart';

class PictureBrowserWidget extends StatelessWidget {
  PictureBrowserWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(
      BrowserController(
        pid: Get.parameters['p'],
        initialPage: Get.parameters['offset'],
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
    );
  }

  Widget bodyView() {
    return Obx(
      () => PhotoViewGallery.builder(
        scrollPhysics: ScrollX.physics,
        pageController: BrowserController.to.controller,
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
      ),
    );
  }
}
