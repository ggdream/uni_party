import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uni_party/styles/styles.dart';

class LiveChatWidget extends StatelessWidget {
  const LiveChatWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          chatMsgView(),
          textInputView(),
        ],
      ),
    );
  }

  Expanded chatMsgView() {
    return Expanded(
      child: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.all(8),
          reverse: true,
          itemCount: LiveChatController.to.data.length,
          itemBuilder: (context, index) {
            final model = LiveChatController.to.data[index];
            return ChatBarWidget(
              uid: model.uid,
              username: model.username,
              text: model.text,
            );
          },
        ),
      ),
    );
  }

  /// 顶部输入栏
  Widget textInputView() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          textFieldView(),
          SizedBox(width: 8),
          ElevatedButton(
            onPressed: LiveChatController.to.send,
            child: Text('发送'),
          )
        ],
      ),
    );
  }

  /// 底部输入框
  Expanded textFieldView() {
    return Expanded(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.grey[200],
        ),
        child: TextField(
          focusNode: LiveChatController.to.focusNode,
          controller: LiveChatController.to.controller,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: '说点什么叭...',
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            focusedBorder: _border,
            enabledBorder: _border,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder get _border {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(16),
    );
  }
}

class ChatBarWidget extends StatelessWidget {
  const ChatBarWidget({
    Key? key,
    required this.uid,
    required this.username,
    required this.text,
    this.color,
  }) : super(key: key);

  final int uid;
  final String username;
  final String text;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: username,
            style: TextStyle(color: color ?? ColorsX.green),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print('进入用户空间: $uid');
              },
          ),
          TextSpan(
            text: ': $text',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class ChatModel {
  final int uid;
  final String username;
  final String text;

  ChatModel({
    required this.uid,
    required this.username,
    required this.text,
  });
}

/// 直播聊天控制器
class LiveChatController extends GetxController {
  final int room;
  LiveChatController(this.room);

  var data = <ChatModel>[
    ChatModel(
      uid: 50,
      username: 'username',
      text: 'text',
    ),
  ].obs;

  static LiveChatController get to => Get.find();

  final controller = TextEditingController();
  final focusNode = FocusNode();

  /// 发送消息
  Future<void> send() async {
    final text = controller.text;
    if (text.isEmpty) return;

    // TODO: Websocket发送消息
    // TODO: 发送成功后写入`data`
    data.insert(
      0,
      ChatModel(
        uid: 50,
        username: 'username',
        text: text,
      ),
    );
    // data = data.reversed.toList().obs;
    // 清空输入框，失去焦点
    controller.text = '';
    focusNode.unfocus();
  }
}
