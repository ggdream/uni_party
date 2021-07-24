import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:uni_party/tools/device/device.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

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

  Future<String> _save2Gallery(Uint8List data, String name) async {
    String location = '';

    if (DeviceType.isMobile) {
      var result = (await ImageGallerySaver.saveImage(data, name: name));
      if (result.isSuccess as bool) {
        location = result.filePath;
      }
    } else {
      var dir = await getDownloadsDirectory();
      if (dir == null) throw 'can\'t find downloads directory';

      File file = File(join(dir.path, name));
      if (await file.exists()) {
        await file.delete();
      }
      await file.writeAsBytes(data, flush: true);
      location = join(dir.path, name);
    }

    return location;
  }

  Future<Uint8List> capture({
    double? pixelRatio,
    ImageByteFormat format = ImageByteFormat.png,
  }) async =>
      _toUint8List(pixelRatio: pixelRatio, format: format);

  Future<String> save(
    String name, {
    double? pixelRatio,
    ImageByteFormat format = ImageByteFormat.png,
  }) async =>
      _toUint8List(pixelRatio: pixelRatio, format: format)
          .then((data) => _save2Gallery(data, name));
}
