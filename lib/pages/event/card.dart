import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suit/suit.dart';

import 'package:uni_party/components/rounded/rounded.dart';
import 'package:uni_party/components/snackbar/snackbar.dart';
import 'package:uni_party/components/toast/toast.dart';
import 'package:uni_party/router/router.dart';
import 'package:uni_party/styles/styles.dart';

class NotifyCard extends StatefulWidget {
  NotifyCard({
    Key? key,
    required this.uid,
    required this.eid,
    required this.username,
    required this.avatarURL,
    required this.datetime,
    required this.title,
    required this.isLiked,
    required this.isCollected,
  }) : super(key: key);

  final String uid;
  final String eid;
  final String username;
  final String avatarURL;
  final String datetime;
  final String title;
  final bool isLiked;
  final bool isCollected;

  @override
  _NotifyCardState createState() => _NotifyCardState();
}

class _NotifyCardState extends State<NotifyCard> {
  late bool isLiked;
  late bool isCollected;

  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked;
    isCollected = widget.isCollected;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Get.toNamed(RouteNames.EventSubscribeVote),
      child: Container(
        width: double.infinity,
        height: 61.8.vw,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: PhysicalModel(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: mainView(),
          ),
          color: Colors.white,
          elevation: 4,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget mainView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        topMetaInfo(),
        centerContent(),
        Spacer(),
        bottomActions(),
      ],
    );
  }

  Widget bottomActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            if (isLiked) return;
            setState(() {
              isLiked = !isLiked;
            });
          },
          icon: isLiked
              ? Icon(
                  Icons.mark_email_read_rounded,
                  color: ColorsX.pink,
                )
              : Icon(Icons.mark_email_unread_rounded),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              isCollected = !isCollected;
            });
            SnackBarX.showRaw(context, isCollected ? '收藏成功' : '取消收藏');
          },
          icon: isCollected
              ? Icon(
                  Icons.savings_rounded,
                  color: ColorsX.pink,
                )
              : Icon(Icons.savings_outlined),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.mode_comment_outlined),
        ),
      ],
    );
  }

  Widget centerContent() {
    return Text(
      widget.title,
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget topMetaInfo() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(RouteNames.ProfileInfoBrowse);
          },
          child: RoundedAvatar.network(
            widget.avatarURL,
            size: 48,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.username,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(widget.datetime),
          ],
        ),
        Spacer(),
        _MoreOperatesBtn(
          onSelected: (value) {
            print(value);
          },
        ),
      ],
    );
  }
}

enum _MoreOperate {
  share,
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
      onSelected: onSelected,
      itemBuilder: (context) {
        return <PopupMenuEntry<_MoreOperate>>[
          PopupMenuItem(
            child: Text('分享'),
            value: _MoreOperate.share,
          ),
          PopupMenuItem(
            child: Text('举报'),
            value: _MoreOperate.report,
          ),
        ];
      },
    );
  }
}
