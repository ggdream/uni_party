import 'package:flutter/material.dart';
import 'package:suit/suit.dart';

import 'compose.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  int _currentIdx = Compose.startIdx;

  @override
  Widget build(BuildContext context) {
    Adapter.initialize(context);

    return Scaffold(
      body: IndexedStack(
        index: _currentIdx,
        children: Compose.pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIdx,
        items: Compose.navItems,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIdx = index;
          });
        },
      ),
    );
  }
}
