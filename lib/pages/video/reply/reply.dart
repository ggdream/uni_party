import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:uni_party/styles/styles.dart';
import 'package:uni_party/widgets/expandable_text/expanded_text.dart';

import 'controller.dart';
import 'emoji.dart';

export 'controller.dart';

/// 底部弹出式根级评论视图
class VideoReplyRootView extends StatelessWidget {
  VideoReplyRootView({
    Key? key,
    required String vid,
  })  : _controller = Get.put(ReplyController(vid)),
        super(key: key);

  final ReplyController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.chat_bubble_fill,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
                Text(
                  '26500条评论',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              physics: ScrollX.physics,
              children: [
                ReplyCardWidget(
                  uid: 55,
                  cid: 5,
                  username: '沙卡拉卡',
                  avatar: 'http://qy7zrkdso.hn-bkt.clouddn.com/image/952.jpg',
                  content: '乘，蒙了，不是动词吗？惊了',
                  logo: 'http://qy7zrkdso.hn-bkt.clouddn.com/image/952.jpg',
                ),
                ReplyCardWidget(
                  uid: 55,
                  cid: 5,
                  username: '沙卡拉卡',
                  avatar: 'http://qy7zrkdso.hn-bkt.clouddn.com/image/952.jpg',
                  content: '乘，蒙了，不是动词吗？惊了',
                  logo: 'http://qy7zrkdso.hn-bkt.clouddn.com/image/952.jpg',
                ),
                ReplyCardWidget(
                  uid: 55,
                  cid: 5,
                  username: '沙卡拉卡',
                  avatar: 'http://qy7zrkdso.hn-bkt.clouddn.com/image/952.jpg',
                  content: '乘，蒙了，不是动词吗？惊了',
                  logo: 'http://qy7zrkdso.hn-bkt.clouddn.com/image/952.jpg',
                ),
                ReplyCardWidget(
                  uid: 55,
                  cid: 5,
                  username: '沙卡拉卡',
                  avatar: 'http://qy7zrkdso.hn-bkt.clouddn.com/image/952.jpg',
                  content: '乘，蒙了，不是动词吗？惊了',
                  logo: 'http://qy7zrkdso.hn-bkt.clouddn.com/image/952.jpg',
                ),
              ],
            ),
          ),
          SafeArea(
            child: TextInputWidget(),
          ),
        ],
      ),
    );
  }
}

class TextInputWidget extends StatelessWidget {
  const TextInputWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TextFieldController());
    return Container(
      padding: const EdgeInsets.only(top: 8),
      child: textInputView(
        context,
        true,
        () async {
          await TextFieldController.to.onClickTextField();
          await showDialog(
            context: context,
            builder: (context) {
              return inputView(context);
            },
          );
        },
      ),
    );
  }

  /// 上方新建覆盖层，编辑消息
  Scaffold inputView(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox.expand(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            /// 背景阴影
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () async {
                  TextFieldController.to.openEmoji.value = false;
                  Navigator.pop(context);
                  await SystemChannels.textInput.invokeMethod('TextInput.hide');
                },
                child: Container(color: Colors.black.withOpacity(.5)),
              ),
            ),

            /// 编辑框
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  textInputView(
                    context,
                    false,
                    TextFieldController.to.onClickTextField,
                    true,
                  ),
                  Obx(
                    () => TextFieldController.to.openEmoji.value
                        ? SelectEmojiWidget()
                        : Container(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 文本输入框
  Row textInputView(BuildContext context, bool canUse, void Function() onTap,
      [bool autofocus = false]) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(width: 0),
              color: Colors.grey[200],
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: TextFieldController.to.openEmojiField,
                  color: Colors.black,
                  icon: Icon(CupertinoIcons.smiley),
                ),
                Expanded(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 40),
                    child: TextField(
                      autofocus: autofocus,
                      controller: TextFieldController.to.controller,
                      onTap: onTap,
                      readOnly: canUse,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 8),
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(CupertinoIcons.paperplane_fill),
          label: Text('发送'),
        )
      ],
    );
  }
}

/// 评论展示卡片
class ReplyCardWidget extends StatelessWidget {
  const ReplyCardWidget({
    Key? key,
    required this.uid,
    required this.cid,
    required this.username,
    required this.avatar,
    required this.logo,
    required this.content,
  }) : super(key: key);

  final int uid;
  final int cid;
  final String username;
  final String avatar;
  final String logo;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.white.withOpacity(.6),
            width: 0.4,
          ),
        ),
      ),
      child: coreView(),
    );
  }

  Widget coreView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipOval(
          child: Image.network(
            avatar,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 16),
        textView(),
      ],
    );
  }

  Widget textView() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          usernameView(),
          Text(
            'data',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white.withOpacity(.6)),
          ),
          SizedBox(height: 8),
          // ExpandableText(
          //   maxLines: 4,
          //   style: TextStyle(color: Colors.white),
          //   text: 'kkkkk',
          //   markerStyle: TextStyle(color: Colors.yellow),
          // ),
          ExpandableText(
            text:
                '不管原理怎样，现在需要的效果是使视图常驻，立马找到了KeepAlive和AutomaticKeepAlive控件，然而让人费解的是这两个控件必须声明祖先节点SliverWithKeepAliveWidget，否则就崩溃。好在找到了这篇文章，核心意思是必须通过StatefulWidget的状态',
            style: TextStyle(color: Colors.white),
            tName: 'ssss',
            tUID: 2412,
            uStyle: TextStyle(color: Color(0xfffff0b3)),
          ),
          SizedBox(height: 8),
          actionsView(),
          SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xff313131),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                ExpandableText(
                  text:
                      '不管原理怎样，现在需要的效果是使视图常驻，立马找到了KeepAlive和AutomaticKeepAlive控件，然而让人费解的是这两个控件必须声明祖先节点SliverWithKeepAliveWidget，否则就崩溃。好在找到了这篇文章，核心意思是必须通过StatefulWidget的状态',
                  maxLines: 2,
                  canExtend: false,
                  style: TextStyle(color: Colors.white),
                  fName: '莫卡拉卡',
                  fUID: 1,
                  tName: 'ssss',
                  tUID: 2412,
                  uStyle: TextStyle(color: Color(0xfffff0b3)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget actionsView() {
    return Row(
      children: [
        Spacer(),
        StarActionCounterWidget(
          cid: 'sss',
          isLiked: false,
          counter: 36,
        ),
        SizedBox(width: 8),
        IconButton(
          onPressed: () {},
          color: Colors.white,
          icon: Icon(CupertinoIcons.arrowshape_turn_up_right),
        ),
        // _MoreOperatesBtn(),
      ],
    );
  }

  Widget usernameView() {
    return Row(
      children: [
        Flexible(
          child: Text(
            '魔咔啦咔',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(.6)),
          ),
        ),
        // SizedBox(width: 8),
        // ClipOval(
        //   child: Image.network(
        //     logo,
        //     width: 24,
        //     height: 24,
        //     fit: BoxFit.cover,
        //   ),
        // ),
      ],
    );
  }
}

class StarActionCounterWidget extends StatefulWidget {
  const StarActionCounterWidget({
    Key? key,
    required this.cid,
    required this.isLiked,
    required this.counter,
  }) : super(key: key);

  final String cid;
  final bool isLiked;
  final int counter;

  @override
  _StarActionCounterWidgetState createState() =>
      _StarActionCounterWidgetState();
}

class _StarActionCounterWidgetState extends State<StarActionCounterWidget> {
  late bool _isLiked;
  late int _counter;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.isLiked;
    _counter = widget.counter;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            onPressed: _onClick,
            icon: Icon(
              Icons.favorite_rounded,
              color: _isLiked ? Colors.red : Colors.white,
            )),
        Text(
          _counter.toString(),
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Future<void> _onClick() async {
    setState(() {
      _isLiked = !_isLiked;
    });
    _isLiked ? _counter++ : _counter--;
  }
}

enum _MoreOperate {
  report,
}

class _MoreOperatesBtn extends StatelessWidget {
  const _MoreOperatesBtn({
    Key? key,
    this.onSelected,
  }) : super(key: key);

  final void Function(_MoreOperate)? onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_MoreOperate>(
      tooltip: '更多操作',
      onSelected: onSelected,
      itemBuilder: (context) {
        return <PopupMenuEntry<_MoreOperate>>[
          PopupMenuItem(
            child: Text('举报'),
            value: _MoreOperate.report,
          ),
        ];
      },
    );
  }
}
