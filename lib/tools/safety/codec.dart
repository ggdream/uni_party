import 'dart:convert';

import 'package:convert/convert.dart';

/// Hex和Base64编解码器
class Codec {
  /// Base64编码
  static String toBase64(String text) {
    var uText = utf8.encode(text);
    return base64Encode(uText);
  }

  /// Base64解码
  static String fromBase64(String text) {
    return String.fromCharCodes(base64Decode(text));
  }

  /// Hex编码
  static String toHex(String text) {
    var uText = utf8.encode(text);
    return hex.encode(uText);
  }

  /// Hex解码
  static String fromHex(String text) {
    return hex.decode(text).toString();
  }
}
