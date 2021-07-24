import 'package:flutter/material.dart';

class Toast {
  static late OverlayEntry _overlayEntry;
  static bool _lock = false;

  static final _boxDecoration = BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.circular(8),
  );

  static void _make({
    required BuildContext context,
    String? message,
    Widget? child,
  }) {
    if (message == null && child == null)
      throw 'must choose one between message and child';

    if (message != null) {
      _overlayEntry = OverlayEntry(builder: (context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: kBottomNavigationBarHeight +
                  MediaQuery.of(context).padding.bottom +
                  6,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 4,
            ),
            decoration: _boxDecoration,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  message,
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        );
      });
    } else if (child != null) {
      _overlayEntry = OverlayEntry(builder: (context) => child);
    }
  }

  static Future<void> show({
    required BuildContext context,
    String? message,
    Widget? child,
    Duration interval = const Duration(seconds: 3),
  }) async {
    if (_lock) remove();

    _make(context: context, message: message, child: child);
    _lock = true;
    Overlay.of(context)!.insert(_overlayEntry);

    return Future.delayed(interval, () => remove());
  }

  static void remove() {
    if (!_lock) return;
    _overlayEntry.remove();
    _lock = false;
  }
}
