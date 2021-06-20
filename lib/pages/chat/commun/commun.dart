import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uni_party/components/button/button.dart';
import 'package:uni_party/components/sheet/sheet.dart';
import 'package:uni_party/models/models.dart';
import 'package:uni_party/styles/styles.dart';

import 'bubble.dart';
import 'select_emoji.dart';

class ChatCommunPage extends StatefulWidget {
  const ChatCommunPage({Key? key}) : super(key: key);

  @override
  _ChatCommunPageState createState() => _ChatCommunPageState();
}

class _ChatCommunPageState extends State<ChatCommunPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _editingController = TextEditingController();

  final _args = Get.arguments as Chat2CommunRouteModel;

  final List<ChatBubbleWidget> _chatMsgs = [];

  @override
  void initState() {
    super.initState();
    this._initPosition();
  }

  Future<void> _initPosition() => Future.delayed(Duration(milliseconds: 40))
          .then((_) => _scrollController
              .jumpTo(_scrollController.position.maxScrollExtent))
          .catchError(
        (e) {
          print(e);
        },
      );

  @override
  Widget build(BuildContext context) {
    if (_scrollController.hasClients)
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent + 64);

    return Scaffold(
      appBar: appBar(),
      body: bodyView(),
    );
  }

  Widget bodyView() {
    return Column(
      children: [
        messagesView(),
        workView(),
      ],
    );
  }

  Widget messagesView() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const NetworkImage('http://127.0.0.1:9999/355.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          controller: _scrollController,
          children: _chatMsgs,
          physics: const BouncingScrollPhysics(),
        ),
      ),
    );
  }

  Widget workView() {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: 72,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        alignment: Alignment.center,
        child: Row(
          children: [
            textEditorView(),
            SizedBox(
              width: 12,
            ),
            TextButton(
              onPressed: _sendMsg,
              child: Text('发送'),
              style: BtnStyles.textStyle(context),
            ),
          ],
        ),
      ),
    );
  }

  _sendMsg() {
    final text = _editingController.text;
    if (text == '') return; // 不允许发送空消息

    final msgWidget = ChatBubbleWidget(
      avatar: 'http://127.0.0.1:9999/948.jpg',
      text: text,
      textDirection: TextDirection.rtl,
    );
    setState(() {
      _chatMsgs.add(msgWidget);
    });

    _editingController.clear();
  }

  Widget textEditorView() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: textEditor(),
      ),
    );
  }

  Future<void> _selectEmoji() async {
    String? emoji = await showTypeBottomSheet(context, SelectEmojiWidget());
    if (emoji == null) return;

    _editingController.text += emoji;
  }

  TextField textEditor() {
    return TextField(
      cursorColor: ColorsX.grey,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      controller: _editingController,
      decoration: _inputDecoration(),
      enableInteractiveSelection: true,
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      isDense: true,
      suffixIcon: IconButton(
        onPressed: _selectEmoji,
        icon: Icon(
          Icons.emoji_emotions_outlined,
          color: ColorsX.grey,
        ),
      ),
      disabledBorder: BorderX.outlineInputBorder,
      border: BorderX.outlineInputBorder,
      enabledBorder: BorderX.outlineInputBorder,
      errorBorder: BorderX.outlineInputBorder,
      focusedBorder: BorderX.outlineInputBorder,
      focusedErrorBorder: BorderX.outlineInputBorder,
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      leading: BackBtn(),
      title: Text(_args.uname),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.phone_rounded),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.person_rounded),
        ),
      ],
    );
  }
}
