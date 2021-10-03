import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path/path.dart' show join, basename;
import 'package:path_provider/path_provider.dart';

class Saver {
  static Future<Response> _downloadData(
    String url,
    dst, {
    Map<String, dynamic>? headers,
    ProgressCallback? onReceiveProgress,
  }) async {
    final dio = Dio();
    return await dio.download(
      url,
      dst,
      options: Options(headers: headers),
      onReceiveProgress: onReceiveProgress,
    );
  }

  static Future<Uint8List> _requestData(
    String url, {
    Map<String, dynamic>? headers,
    ProgressCallback? onReceiveProgress,
  }) async {
    final dio = Dio();
    final res = await dio.get(
      url,
      onReceiveProgress: onReceiveProgress,
      options: Options(headers: headers, responseType: ResponseType.bytes),
    );
    return Uint8List.fromList(res.data);
  }

  /// 下载网络图片
  static Future<String?> image(
    String url, {
    Map<String, dynamic>? headers,
    ProgressCallback? onReceiveProgress,
  }) async {
    if (Platform.isAndroid || Platform.isIOS) {
      final data = await _requestData(
        url,
        headers: headers,
        onReceiveProgress: onReceiveProgress,
      );
      final res = await ImageGallerySaver.saveImage(data);

      return res?['filePath'];
    } else {
      final dir = await getDownloadsDirectory();
      if (dir == null) return null;

      final filePath = join(dir.path, basename(url));
      await _downloadData(
        url,
        filePath,
        headers: headers,
        onReceiveProgress: onReceiveProgress,
      );

      return filePath;
    }
  }
}
