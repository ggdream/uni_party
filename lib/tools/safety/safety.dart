import 'dart:math';

import 'encrypt.dart';
import 'hash.dart';
import 'signature.dart';

class Safety {
  final EncRSA _rsa;
  final String _iv;

  Safety(String publicKey, {String iv = '0102030405060708'})
      : _rsa = EncRSA(publicKey),
        _iv = iv;

  static String random(int length) {
    final String _strList =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    String temp = '';
    for (var i = 0; i < length; i++) {
      var ranNum = Random().nextInt(_strList.length);
      temp += _strList.substring(ranNum, ranNum + 1);
    }
    return temp;
  }

  Map<String, String> encrypt(String data) {
    var key = Safety.random(16);

    return {
      'encText': EncAES(key, _iv).encrypt(data).base64,
      'encSecKey': _rsa.encrypt(key).base64
    };
  }


  static hashData(String data) => Hasher.toSha256(data);
  static hashFile(String filename) => Hasher.fileToSha256(filename);
}
