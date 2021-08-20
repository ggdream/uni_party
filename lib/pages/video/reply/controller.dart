import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RootReplyModel {
  final int uid;
  final int cid;
  final int rid;

  final String username;
  final String avatar;
  final String logo;
  final String content;
  final int datetime;

  final int sonCounter;
  final int loveCounter;
  final bool isLove;

  const RootReplyModel({
    required this.uid,
    required this.cid,
    required this.rid,
    required this.username,
    required this.avatar,
    required this.logo,
    required this.content,
    required this.datetime,
    required this.sonCounter,
    required this.loveCounter,
    required this.isLove,
  });
}

class ReplyController extends GetxController {
  final String vid;

  ReplyController(this.vid);
  static ReplyController get to => Get.find();
}

class TextFieldController extends GetxController {
  static TextFieldController get to => Get.find();

  final controller = TextEditingController();

  var openEmoji = false.obs;

  String get text => controller.text;

  /// 发送评论
  Future<void> send() async {
    if (controller.text.isEmpty) return;
  }

  /// 插入字符串，并调整光标的位置（到插入的字符串的后面）
  void addTextAndSuitSelection(String text, int position) {
    if (position == -1) {
      controller.text = text;
      return;
    } else {
      controller.text = controller.text.substring(0, position) +
          text +
          controller.text.substring(position);
    }

    controller.selection =
        TextSelection.collapsed(offset: position + text.length);
  }

  Future<void> onClickTextField() async {
    if (openEmoji.value) {
      openEmoji.value = false;
    }
  }

  Future<void> openEmojiField() async {
    if (openEmoji.value) {
      return;
    }

    await SystemChannels.textInput.invokeMethod('TextInput.hide');
    openEmoji.value = true;

    final int position = controller.selection.baseOffset;
    addTextAndSuitSelection('', position);
  }
}
