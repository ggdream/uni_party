import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uni_party/logic/chat/commun.dart';
import 'package:uni_party/widgets/button/button.dart';
import 'package:uni_party/widgets/sheet/sheet.dart';
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

  late final CommunController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(CommunController(id: _args.id));

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
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
            image: const NetworkImage(
                'https://cdn.jsdelivr.net/gh/mocaraka/assets/temp/355.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Obx(() {
          final data = _controller.data;
          return ListView(
            controller: _scrollController,
            children: List.generate(data.length, (index) {
              return ChatBubbleWidget(
                avatar:
                    'https://cdn.jsdelivr.net/gh/mocaraka/assets/temp/355.jpg',
                text: data[index].message!,
                textDirection: data[index].fromUID == 2
                    ? TextDirection.rtl
                    : TextDirection.ltr,
              );
            }),
            physics: ScrollX.physics,
          );
        }),
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

    // {"type":0,"from_uid":1,"to_uid":2,"message":"搜索","datetime":550,"version":"v1","signature":"首发式地方打"}
    _controller.send(text);
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent + 64);
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
    String? emoji = await showBottomSheetX(context, SelectEmojiWidget());
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
      title: Text(_args.username),
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
