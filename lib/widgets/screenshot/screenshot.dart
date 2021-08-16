import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart' hide Image;
import 'package:flutter/rendering.dart';
import 'package:images_picker/images_picker.dart';

class ScreenShot extends StatelessWidget {
  final Widget child;
  final ShotController controller;

  const ScreenShot({
    Key? key,
    required this.child,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: controller._globalKey,
      child: child,
    );
  }
}

class ShotController {
  final GlobalKey _globalKey = GlobalKey();
  late RenderRepaintBoundary _getBoundaryObject;

  Future<Uint8List> _toUint8List({
    double? pixelRatio,
    ImageByteFormat format = ImageByteFormat.png,
  }) async {
    pixelRatio = pixelRatio ??
        MediaQuery.of(_globalKey.currentContext!).devicePixelRatio;

    _getBoundaryObject =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

    Image image = await _getBoundaryObject.toImage(pixelRatio: pixelRatio);
    ByteData? byteData = await image.toByteData(format: format);

    return byteData!.buffer.asUint8List();
  }

  Future<bool> _save2Gallery(Uint8List data, String name) async {
    return await ImagesPicker.saveImageToAlbum(
      File.fromRawPath(data),
      albumName: name,
    );
  }

  Future<Uint8List> capture({
    double? pixelRatio,
    ImageByteFormat format = ImageByteFormat.png,
  }) async =>
      _toUint8List(pixelRatio: pixelRatio, format: format);

  Future<bool> save(
    String name, {
    double? pixelRatio,
    ImageByteFormat format = ImageByteFormat.png,
  }) async =>
      _toUint8List(pixelRatio: pixelRatio, format: format)
          .then((data) => _save2Gallery(data, name));
}
