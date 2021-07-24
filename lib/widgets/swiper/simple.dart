import 'dart:async';

import 'package:flutter/material.dart';

class SimpleSwiper extends StatefulWidget {
  final List<Widget> children;
  final Duration interval;
  final ScrollPhysics scrollPhysics;

  const SimpleSwiper({
    Key? key,
    required this.children,
    this.interval = const Duration(seconds: 3),
    this.scrollPhysics = const NeverScrollableScrollPhysics(),
  }) : super(key: key);

  @override
  _SimpleSwiperState createState() => _SimpleSwiperState();
}

class _SimpleSwiperState extends State<SimpleSwiper> {
  late final PageController _controller;
  late final Timer _timer;
  late final int _total;

  int _currentIdx = 0;

  @override
  void initState() {
    super.initState();
    this._initTimer();
    _controller = PageController();
    _total = widget.children.length;
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: widget.children,
      physics: widget.scrollPhysics,
      onPageChanged: (int index) {
        setState(() {
          _currentIdx = index;
        });
      },
    );
  }

  void _initTimer() => _timer = Timer.periodic(widget.interval, _timerCallback);

  void _timerCallback(Timer timer) {
    _controller.animateToPage(
      (_currentIdx + 1) % _total,
      duration: Duration(milliseconds: 200),
      curve: Curves.ease,
    );
  }
}
