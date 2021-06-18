import 'package:flutter/material.dart';
import 'package:suit/suit.dart';

class _Emojis {
  static final List<String> emojis = [
    "\u{1f600}",
    "\u{1f601}",
    "\u{1f602}",
    "\u{1f603}",
    "\u{1f604}",
    "\u{1f605}",
    "\u{1f606}",
    "\u{1f607}",
    "\u{1f608}",
    "\u{1f609}",
    "\u{1f60a}",
    "\u{1f60b}",
    "\u{1f60c}",
    "\u{1f60d}",
    "\u{1f60e}",
    "\u{1f60f}",
    "\u{1f610}",
    "\u{1f611}",
    "\u{1f612}",
    "\u{1f613}",
    "\u{1f614}",
    "\u{1f615}",
    "\u{1f616}",
    "\u{1f617}",
    "\u{1f618}",
    "\u{1f619}",
    "\u{1f61a}",
    "\u{1f61b}",
    "\u{1f61c}",
    "\u{1f61d}",
    "\u{1f61e}",
    "\u{1f61f}",
    "\u{1f620}",
    "\u{1f621}",
    "\u{1f622}",
    "\u{1f623}",
    "\u{1f624}",
    "\u{1f625}",
    "\u{1f626}",
    "\u{1f627}",
    "\u{1f628}",
    "\u{1f629}",
    "\u{1f62a}",
    "\u{1f62b}",
    "\u{1f62c}",
    "\u{1f62d}",
    "\u{1f62e}",
    "\u{1f62f}",
    "\u{1f630}",
    "\u{1f631}",
    "\u{1f632}",
    "\u{1f633}",
    "\u{1f634}",
    "\u{1f635}",
    "\u{1f636}",
    "\u{1f637}",
    "\u{1f638}",
    "\u{1f639}",
    "\u{1f63a}",
    "\u{1f63b}",
    "\u{1f63c}",
    "\u{1f63d}",
    "\u{1f63e}",
    "\u{1f63f}",
    "\u{1f640}",
    "\u{1f641}",
    "\u{1f642}",
    "\u{1f643}",
    "\u{1f644}",
    "\u{1f645}",
    "\u{1f646}",
    "\u{1f647}",
    "\u{1f648}",
    "\u{1f649}",
    "\u{1f64a}",
    "\u{1f64b}",
    "\u{1f64c}",
    "\u{1f64d}",
    "\u{1f64e}",
    "\u{1f64f}",
  ];
}

class SelectEmojiWidget extends StatelessWidget {
  const SelectEmojiWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 36.vh,
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 12,
      ),
      child: coreView(context),
    );
  }

  Widget coreView(BuildContext context) {
    var list = List.generate(
      _Emojis.emojis.length,
      (index) => emojiView(context, index),
    );
    return SafeArea(
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
        ),
        children: list,
      ),
    );
  }

  Widget emojiView(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(_Emojis.emojis[index]),  // String
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(
          _Emojis.emojis[index],
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
