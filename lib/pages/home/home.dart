import 'package:flutter/material.dart';
import 'package:suit/suit.dart';

import 'compose.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        onTap: (int index) {
          setState(() {
            _currentIdx = index;
          });
        },
      ),
    );
  }
}
