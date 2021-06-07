import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';

class Hasher {
  static String toMD5(String data) => md5.convert(utf8.encode(data)).toString();

  static String toSha256(String data) =>
      sha256.convert(utf8.encode(data)).toString();

  static Future<String> fileToSha256(String filename) async =>
      sha256.bind(File(filename).openRead()).first.toString();
}
