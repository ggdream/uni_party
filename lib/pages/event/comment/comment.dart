import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'package:uni_party/components/rounded/rounded.dart';
import 'package:uni_party/components/sex/sex.dart';

class EventCommentPage extends StatelessWidget {
  const EventCommentPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          _CommentCardWidget(text: '乘，蒙了，不是动词吗？惊了', avatar: 'http://qvgbcgfc6.hn-bkt.clouddn.com/image/952.jpg', uname: '沙卡拉卡',),
          _CommentCardWidget(
            avatar: 'http://qvgbcgfc6.hn-bkt.clouddn.com/image/777.jpg',
            uname: '光影和你',
              text:
                  '一乘 【yī shèng 】一乘，词语，意为：物之四数；表数量，用于马、车、轿子等；方六里为一乘之地；佛教语，谓引导教化一切众生成佛的唯一方法或途径。《法华经》首倡此说。乘，指车乘，比喻能载人到达涅槃境界。《法华经·方便品》：“十方佛土之中，唯有一乘法，无二亦无三，除佛方便说。” 唐 玄奘 《谢敕赉经序启》：“搜扬三藏，尽龙宫之所储；研究一乘，穷 鷲岭 之遗旨。” 唐 白居易 《爱咏诗》：“辞章讽咏成千首，心行归依向一乘。”我国佛教宗派如 华严宗 等对此还有一些说法。参见“ 一乘显性教 ”。'),
        ],
      ),
    );
  }
}

class _CommentCardWidget extends StatelessWidget {
  const _CommentCardWidget({
    Key? key,
    required this.avatar,
    required this.uname,
    required this.text,
  }) : super(key: key);

  final String avatar;
  final String uname;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          topView(),
          mainView(),
        ],
      ),
    );
  }

  Widget mainView() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: Text(text)),
          SizedBox(width: 8),
          StarActionCounterWidget(
            cid: 'sss',
            isLiked: false,
            counter: 36,
          ),
        ],
      ),
    );
  }

  Widget topView() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8),
      child: Row(
        children: [
          RoundedAvatar.network(
            avatar,
            size: 36,
          ),
          SizedBox(width: 12),
          unameAndMottoView(),
          _MoreOperatesBtn(),
        ],
      ),
    );
  }

  Widget unameAndMottoView() {
    return Expanded(
      child: RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          children: [
            WidgetSpan(
              alignment: ui.PlaceholderAlignment.middle,
              child: SexView(isMan: false),
            ),
            TextSpan(
              text: uname,
            ),
          ],
        ),
      ),
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
          icon: _isLiked
              ? Icon(
                  Icons.favorite_rounded,
                  color: Colors.red,
                )
              : Icon(Icons.favorite_border_rounded),
        ),
        Text(_counter.toString()),
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
