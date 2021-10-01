import 'package:flutter/material.dart';

class PopInterceptor extends StatefulWidget {
  const PopInterceptor({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  _PopInterceptorState createState() => _PopInterceptorState();
}

class _PopInterceptorState extends State<PopInterceptor> {
  DateTime? _lastPressedAt;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: widget.child,
      onWillPop: _onWillPop,
    );
  }

  Future<bool> _onWillPop() async {
    if (_lastPressedAt == null) {
      return false;
    }

    final time = DateTime.now();
    if (time.difference(_lastPressedAt!) > Duration(seconds: 1)) {
      _lastPressedAt = time;
      return false;
    }

    return true;
  }
}
