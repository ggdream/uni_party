import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/asymmetric/api.dart';

/// EncAES encrypt and decrypt of AES
class EncAES {
  Key? _key;
  IV? _iv;
  Encrypter? _encrypter;

  EncAES(String key, String iv) {
    this._key = Key.fromUtf8(key);
    this._iv = IV.fromUtf8(iv);
    this._encrypter = Encrypter(AES(_key!, mode: AESMode.cbc));
  }

  Encrypted encrypt(String data) => _encrypter!.encrypt(data, iv: _iv);
  dynamic decrypt(Encrypted data) => _encrypter!.decrypt(data, iv: _iv);
}

/// EncRSA encrypt and decrypt of RSA
class EncRSA {
  RSAPublicKey? _publicKey;
  Encrypter? _encrypter;

  EncRSA(String publicKey) {
    _publicKey = RSAKeyParser().parse(publicKey) as RSAPublicKey;
    _encrypter = Encrypter(RSA(publicKey: _publicKey));
  }

  Encrypted encrypt(String data) => _encrypter!.encrypt(data);
  dynamic decrypt(Encrypted data) => _encrypter!.decrypt(data);
}
