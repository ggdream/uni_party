import 'package:flutter/material.dart';

import 'package:uni_party/components/button/button.dart';

import 'bubble.dart';

class ChatCommunPage extends StatefulWidget {
  const ChatCommunPage({Key? key}) : super(key: key);

  @override
  _ChatCommunPageState createState() => _ChatCommunPageState();
}

class _ChatCommunPageState extends State<ChatCommunPage> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    this._initPosition();
  }

  Future<void> _initPosition() => Future.delayed(Duration(milliseconds: 40))
          .then((_) => _controller.jumpTo(_controller.position.maxScrollExtent))
          .catchError(
        (e) {
          print(e);
        },
      );

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
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const NetworkImage('http://127.0.0.1:9999/355.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: ListView(
              controller: _controller,
              children: [
                ChatBubbleWidget(
                  avatar: 'http://127.0.0.1:9999/395.jpg',
                  text: '喔唷偶埃及法破个爱福家评分IPA发批发价阿AV没MV阿娜',
                  textDirection: TextDirection.ltr,
                ),
                ChatBubbleWidget(
                  avatar: 'http://127.0.0.1:9999/395.jpg',
                  text: '喔唷偶埃及法破个爱福家评分IPA发批发价阿AV没MV阿娜',
                  textDirection: TextDirection.ltr,
                ),
                ChatBubbleWidget(
                  avatar: 'http://127.0.0.1:9999/395.jpg',
                  text: '喔唷偶埃及法破个爱福家评分IPA发批发价阿AV没MV阿娜',
                  textDirection: TextDirection.ltr,
                ),
                ChatBubbleWidget(
                  avatar: 'http://127.0.0.1:9999/395.jpg',
                  text: '喔唷偶埃及法破个爱福家评分IPA发批发价阿AV没MV阿娜',
                  textDirection: TextDirection.ltr,
                ),
                ChatBubbleWidget(
                  avatar: 'http://127.0.0.1:9999/395.jpg',
                  text: '喔唷偶埃及法破个爱福家评分IPA发批发价阿AV没MV阿娜',
                  textDirection: TextDirection.ltr,
                ),
                ChatBubbleWidget(
                  avatar: 'http://127.0.0.1:9999/395.jpg',
                  text: '喔唷偶埃及法破个爱福家评分IPA发批发价阿AV没MV阿娜',
                  textDirection: TextDirection.ltr,
                ),
                ChatBubbleWidget(
                  avatar: 'http://127.0.0.1:9999/395.jpg',
                  text: '喔唷偶埃及法破个爱福家评分IPA发批发价阿AV没MV阿娜',
                  textDirection: TextDirection.ltr,
                ),
                ChatBubbleWidget(
                  avatar: 'http://127.0.0.1:9999/395.jpg',
                  text: '喔唷偶埃及法破个爱福家评分IPA发批发价阿AV没MV阿娜',
                  textDirection: TextDirection.ltr,
                ),
                ChatBubbleWidget(
                  avatar: 'http://127.0.0.1:9999/395.jpg',
                  text: '喔唷偶埃及法破个爱福家评分IPA发批发价阿AV没MV阿娜',
                  textDirection: TextDirection.ltr,
                ),
                ChatBubbleWidget(
                  avatar: 'http://127.0.0.1:9999/395.jpg',
                  text: '喔唷偶埃及法破个爱福家评分IPA发批发价阿AV没MV阿娜',
                  textDirection: TextDirection.ltr,
                ),
                ChatBubbleWidget(
                  avatar: 'http://127.0.0.1:9999/395.jpg',
                  text: '喔唷偶埃及法破个爱福家评分IPA发批发价阿AV没MV阿娜',
                  textDirection: TextDirection.ltr,
                ),
                ChatBubbleWidget(
                  avatar: 'http://127.0.0.1:9999/395.jpg',
                  text: '喔唷偶埃及法破个爱福家评分IPA发批发价阿AV没MV阿娜',
                  textDirection: TextDirection.ltr,
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 96,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Send'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      leading: BackBtn(),
      title: Text(''),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.person_rounded),
        ),
      ],
    );
  }
}
