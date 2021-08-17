import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uni_party/logic/event/event.dart';

import 'package:uni_party/widgets/rounded/rounded.dart';
import 'package:uni_party/widgets/sheet/sheet.dart';
import 'package:uni_party/widgets/snackbar/snackbar.dart';
import 'package:uni_party/router/router.dart';
import 'package:uni_party/styles/styles.dart';

import 'comment/comment.dart';

class NotifyCard extends StatefulWidget {
  NotifyCard({
    Key? key,
    required this.uid,
    required this.eid,
    required this.type,
    required this.username,
    required this.avatarURL,
    required this.datetime,
    required this.title,
    required this.isLiked,
    required this.isCollect,
  }) : super(key: key);

  final String uid;
  final String eid;
  final EventPublishType type;
  final String username;
  final String avatarURL;
  final String datetime;
  final String title;
  final bool isLiked;
  final bool isCollect;

  @override
  _NotifyCardState createState() => _NotifyCardState();
}

class _NotifyCardState extends State<NotifyCard> {
  late bool isLiked;
  late bool isCollect;

  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked;
    isCollect = widget.isCollect;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: InkWell(
        onTap: () => Get.toNamed(EventTypePage.getPageByEnum(widget.type)!),
        child: PhysicalModel(
          child: mainView(),
          color: Colors.white,
          elevation: 4,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  Widget mainView() {
    return Container(
      width: double.infinity,
      height: 240,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          topMetaInfo(),
          SizedBox(height: 16),
          centerContent(),
          Spacer(),
          bottomActions(),
        ],
      ),
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
                isCollect = !isCollect;
              });
              SnackBarX.showRaw(context, isCollect ? '关注成功' : '取消关注');
            },
            icon: Icon(
              Icons.visibility_rounded,
              color: isCollect ? ColorsX.pink : null,
            )),
        IconButton(
          onPressed: () async {
            await showBottomSheetX(
              context,
              EventCommentPage(),
            );
          },
          icon: Icon(Icons.chat_bubble_rounded),
        ),
      ],
    );
  }

  Widget centerContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        widget.title,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  /// 顶部用户头像、昵称、时间...
  Widget topMetaInfo() {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              SizedBox(width: 12),
              InkWell(
                onTap: () => Get.toNamed(RoutesNamespace.ProfileInfoBrowse),
                child: RoundedAvatar.network(widget.avatarURL, size: 48),
              ),
              SizedBox(width: 12),
              usernameView(),
            ],
          ),
        ),
        _MoreOperatesBtn(
          onSelected: (value) {
            print(value);
          },
        ),
      ],
    );
  }

  /// 用户昵称和时间
  Flexible usernameView() {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.username,
            maxLines: 1,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(widget.datetime, maxLines: 1),
        ],
      ),
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
      tooltip: '更多操作',
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
