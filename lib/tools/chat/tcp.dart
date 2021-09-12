import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'dart:typed_data';

import 'package:protobuf/protobuf.dart';

import 'type.dart';

class TcpConntect {
  late Socket socket;
  late StreamSubscription<Uint8List> stream;

  final _timeout = Duration(seconds: 3);
  Uint8List _cacheData = Uint8List(0);

  TcpConntect._init() {
    print('object');
  }

  bool _onBadCertificate(X509Certificate certificate) {
    return true;
  }

  static Future<TcpConntect> connect() async {
    final tcpSocket = TcpConntect._init();
    await tcpSocket.init();
    return tcpSocket;
  }

  Future<void> init() async {
    // socket = await SecureSocket.connect(
    //   '127.0.0.1',
    //   9000,
    //   timeout: _timeout,
    //   onBadCertificate: _onBadCertificate,
    // );
    socket = await Socket.connect(
      '127.0.0.1',
      9000,
      timeout: _timeout,
    );
  }

  void write(GeneratedMessage? data, {int version = 1, int type = 0}) {
    Uint8List body = Uint8List(0);
    int bodyLength = 0;
    if (data != null) {
      body = data.writeToBuffer();
      bodyLength = body.length;
    }

    final header = ByteData(Messager.headerLen);
    header.setUint8(0, version);
    header.setUint8(Messager.versionLen, type);
    header.setUint16(Messager.versionLen + Messager.typeLen, bodyLength);
    header.setUint32(
        Messager.versionLen + Messager.typeLen + Messager.dataLen, 0);
    header.setUint32(
        Messager.versionLen +
            Messager.typeLen +
            Messager.dataLen +
            Messager.headCRC,
        0);

    final result = data == null
        ? header.buffer.asUint8List()
        : header.buffer.asUint8List() + body;

    final value = utf8.decode(result);
    socket.write(value);
  }

  void read(ReaderCallback callback,
      {Function? onError, void onDone()?, bool? cancelOnError}) {
    stream = socket.listen(
      _onData(callback),
      onError: onError,
      onDone: () async {
        await socket.flush();
        await stream.cancel();
        socket.destroy();
        onDone?.call();
      },
      cancelOnError: cancelOnError,
    );
  }

  void Function(Uint8List) _onData(ReaderCallback callback) {
    return (Uint8List _data) {
      _cacheData = Uint8List.fromList(_cacheData + _data);
      // 如果现有数据长度小于头长度
      if (_cacheData.length < Messager.headerLen) {
        return;
      }

      final byteData = _cacheData.buffer.asByteData();
      final dataLen =
          byteData.getUint16(Messager.versionLen + Messager.typeLen);
      // 判断现有数据长度与包内得出的数据长度与头部长度和的大小关系
      if (_cacheData.length < Messager.headerLen + dataLen) {
        return;
      }

      final version = byteData.getUint8(0);
      final type = byteData.getUint8(Messager.versionLen);
      final headCRC = byteData
          .getUint32(Messager.versionLen + Messager.typeLen + Messager.dataLen);
      final bodyCRC = byteData.getUint32(Messager.versionLen +
          Messager.typeLen +
          Messager.dataLen +
          Messager.headCRC);

      final data = Uint8List(dataLen);
      for (var i = 0; i < dataLen; i++) {
        data[i] = _cacheData[i + Messager.headerLen];
      }


      callback(MessageType.values[type], data.toList());

      // 清除刚才包的数据
      _cacheData = _cacheData.buffer.asUint8List(Messager.headerLen + dataLen,
          _cacheData.length - Messager.headerLen - dataLen);
    };
  }

  Future<void> close() async {
    await socket.flush();
    await stream.cancel();
    await socket.close();
  }
}
