import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';

class SimpleWebSocket {
  String _url;
  var _socket;
  Function()? onOpen;
  Function(dynamic msg)? onMessage;
  Function(int code, String reaso)? onClose;
  SimpleWebSocket(this._url);

  connect() async {
    try {
      //_socket = await WebSocket.connect(_url);
      _socket = await _connectForSelfSignedCert(_url);
      onOpen?.call();
      _socket.listen((data) {
        onMessage?.call(data);
      }, onDone: () {
        onClose?.call(_socket.closeCode, _socket.closeReason);
      });
    } catch (e) {
      onClose?.call(500, e.toString());
    }
  }

  send(data) {
    if (_socket != null) {
      _socket.add(data);
      print('send: $data');
    }
  }

  close() {
    if (_socket != null) _socket.close();
  }

  Future<WebSocket> _connectForSelfSignedCert(url) async {
    try {
      Random r = new Random();
      String key = base64.encode(List<int>.generate(8, (_) => r.nextInt(255)));
      HttpClient client = HttpClient(context: SecurityContext());
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        print(
            'SimpleWebSocket: Allow self-signed certificate => $host:$port. ');
        return true;
      };

      HttpClientRequest request =
          await client.getUrl(Uri.parse(url)); // form the correct url here
      request.headers.add('Connection', 'Upgrade');
      request.headers.add('Upgrade', 'websocket');
      request.headers.add(
          'Sec-WebSocket-Version', '13'); // insert the correct version here
      request.headers.add('Sec-WebSocket-Key', key.toLowerCase());

      HttpClientResponse response = await request.close();
      // ignore: close_sinks
      Socket socket = await response.detachSocket();
      var webSocket = WebSocket.fromUpgradedSocket(
        socket,
        protocol: 'signaling',
        serverSide: false,
      );

      return webSocket;
    } catch (e) {
      throw e;
    }
  }
}

class SignalingService {
  late final GetSocket _socket;

  Future<void> _init(
    String url, {
    required Function() onOpen,
    required Function(dynamic data) onMessage,
    required Function(String? reason) onClose,
  }) async {
    try {
      _socket = GetSocket(url);

      _socket.onOpen(onOpen);
      _socket.onMessage(onMessage);
      _socket.onError((Close close) {
        onClose(close.message);
      });
      await _socket.connect();
    } catch (e) {}
  }

  static Future<SignalingService> connect(
    String url, {
    required void Function() onOpen,
    required void Function(dynamic data) onMessage,
    required void Function(String? reason) onClose,
  }) async {
    final service = SignalingService();
    await service._init(
      url,
      onOpen: onOpen,
      onMessage: onMessage,
      onClose: onClose,
    );

    return service;
  }

  void send(String data) {
    _socket.send(data);
  }

  void close() {
    _socket.close();
  }
}
