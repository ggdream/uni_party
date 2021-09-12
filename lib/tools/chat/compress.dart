import 'dart:convert';

import 'package:archive/archive.dart';

/// gzip数据解压缩
class GZipCompress {
  /// 压缩字符串
  List<int>? enocde(String data) => GZipEncoder().encode(utf8.encode(data));

  /// 压缩字节数据
  List<int>? enocdeBytes(List<int> data) => GZipEncoder().encode(data);

  /// 解压字符串
  List<int> decode(String data) => GZipDecoder().decodeBytes(utf8.encode(data));

  /// 解压字节数组
  List<int> decodeBytes(List<int> data) =>
      GZipDecoder().decodeBytes(data, verify: true);
}
