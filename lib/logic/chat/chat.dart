import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:uni_party/models/chat/chat.dart';

class ChatController extends GetxController {
  late WebSocketChannel channel;

  final data = <ChatWrapper>[].obs;
  final lastList = <ChatWrapper>[].obs;
  final db = <dynamic, List<ChatWrapper>>{}.obs;

  bool isRunning = false;

  @override
  void onInit() {
    super.onInit();
    connectServe();
  }

  @override
  void onClose() {
    close();
    super.onClose();
  }

  void connectServe() async {
    if (isRunning) return;

    try {
      channel = WebSocketChannel.connect(
        Uri.parse('ws://127.0.0.1:8080/v1/chat?fid=2&tid=1'),
      );
      channel.stream.listen(_onData, onDone: _onDone, onError: _onError);
    } catch (e) {}
  }

  void send({
    required ChatType type,
    required int fromUID,
    required int datetime,
    required String version,
    required String signature,
    int? toUID,
    String? groupID,
    String? message,
    String? url,
    dynamic others,
  }) {
    return _send(
      ChatWrapper(
        type: type,
        fromUID: fromUID,
        datetime: datetime,
        version: version,
        signature: signature,
        toUID: toUID,
        groupID: groupID,
        message: message,
        url: url,
        others: others,
      ),
    );
  }

  void _send(ChatWrapper reply) {
    channel.sink.add(reply.toJson());

    // 把自己发送的消息存到数据结构里
    data.add(reply);
    if (reply.groupID == null) {
      if (!db.containsKey(reply.toUID)) db[reply.toUID] = [];
      db[reply.toUID]!.add(reply);
    } else {
      if (!db.containsKey(reply.groupID)) db[reply.groupID] = [];
      db[reply.groupID]!.add(reply);
    }

    _sort(); // 重新排序
  }

  void clear() {
    lastList.clear();
  }

  void close() {
    channel.sink.close();
    isRunning = false;
  }

  void _sort() {
    lastList.clear();

    for (var i in db.values) {
      lastList.add(i.last);
    }

    lastList.sort((a, b) => b.datetime - a.datetime);
  }

  void _onData(dynamic value) {
    late final ChatWrapper reply;

    try {
      reply = ChatWrapper.fromMap(json.decode(value));
    } catch (e) {
      debugPrint(e.toString());
      return;
    }

    if (reply.fromUID == 2) return;
    data.add(reply);
    if (reply.groupID == null) {
      // 单聊
      if (!db.containsKey(reply.fromUID)) db[reply.fromUID] = [];
      db[reply.fromUID]!.add(reply);
    } else {
      // 群聊
      if (!db.containsKey(reply.groupID)) db[reply.groupID] = [];
      db[reply.groupID]!.add(reply);
    }

    _sort(); // 重新排序

    if (Get.currentRoute.startsWith('/chat')) return;
    Get.snackbar('消息', value);
  }

  void _onDone() {
    isRunning = false;
  }

  void _onError(dynamic value) {
    print(value);
    isRunning = false;
  }
}
