import 'dart:convert';

import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatController extends GetxController {
  late WebSocketChannel channel;

  final RxList data = [].obs;

  bool isRunning = false;

  @override
  void onInit() {
    super.onInit();
    connectServe();
  }

  void connectServe() async {
    if (isRunning) return;

    channel = WebSocketChannel.connect(
        Uri.parse('ws://127.0.0.1:8080/v1/chat?fid=2&tid=1'));
    channel.stream.listen(_onData, onDone: _onDone, onError: _onError);
  }

  void send(dynamic data) {
    channel.sink.add(data);
  }

  void close() {
    channel.sink.close();
    isRunning = false;
  }

  void _onData(dynamic _data) {
    late Map<String, dynamic> res;

    try {
      res = json.decode(_data);
    } catch (e) {}

    data.add(res);

    if (Get.currentRoute.startsWith('/chat')) return;
    Get.snackbar('消息', _data);
  }

  void _onDone() {
    isRunning = false;
  }

  void _onError(dynamic value) {
    print(value);
    isRunning = false;
  }
}
