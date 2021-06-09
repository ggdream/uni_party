import 'package:flutter/material.dart';
import 'package:suit/suit.dart';

import 'package:uni_party/components/rounded/rounded.dart';
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
      onTap: () {
        print('object');
      },
      child: Container(
        width: double.infinity,
        height: 61.8.vw,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: mainView(),
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              isLiked = !isLiked;
            });
          },
          icon: isLiked
              ? Icon(
                  Icons.favorite_rounded,
                  color: ColorsX.pink,
                )
              : Icon(Icons.favorite_border_rounded),
        ),
        Spacer(
          flex: 1,
        ),
        IconButton(
          onPressed: () {
            setState(() {
              isCollected = !isCollected;
            });
          },
          icon: isCollected
              ? Icon(
                  Icons.collections_bookmark_rounded,
                  color: ColorsX.pink,
                )
              : Icon(Icons.collections_bookmark_outlined),
        ),
        Spacer(
          flex: 1,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.mode_comment_outlined),
        ),
        Spacer(
          flex: 9,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_horiz_rounded),
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
            print('avatar is clicked');
          },
          child: RoundedAvatar.network(
            widget.avatarURL,
            size: 48,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          widget.username,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Spacer(),
        Text(widget.datetime),
      ],
    );
  }
}
