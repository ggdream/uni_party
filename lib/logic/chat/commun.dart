import 'package:get/get.dart';

import 'package:uni_party/logic/chat/chat.dart';
import 'package:uni_party/models/chat/chat.dart';

class CommunController extends GetxController {
  CommunController({
    required this.id,
  });

  final dynamic id;

  final data = <ChatWrapper>[].obs;
  final _controller = Get.find<ChatController>();

  @override
  void onInit() {
    super.onInit();
    this.listen();
  }

  void listen() {
    if (_controller.db.containsKey(id)) {
      // 如果不在列表，是用户主动发消息
      data.addAll(_controller.db[id]!);
    } else {
      _controller.db[id] = [];
    }

    // 监听收到的消息：按消息的内容做不同的业务，弹窗、省略
    _controller.data.listen((List<ChatWrapper> value) {
      data.add(value.last);
    });
  }

  void send(dynamic value) {
    _controller.send(
      type: ChatType.text,
      fromUID: 2,
      toUID: 1,
      message: value,
      datetime: DateTime.now().millisecondsSinceEpoch,
      version: 'v1',
      signature: 'sign',
    );
  }
}
