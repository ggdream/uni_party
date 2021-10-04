import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class PicturePreviewPage extends StatelessWidget {
  PicturePreviewPage({
    Key? key,
  }) : super(key: key);

  final String image = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoView.customChild(
        enableRotation: true,
        child: Image.network(image),
        backgroundDecoration: BoxDecoration(
          color: Colors.black,
        ),
      ),
    );
  }
}
