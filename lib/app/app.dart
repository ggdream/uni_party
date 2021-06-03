import 'package:flutter/material.dart';

import 'core.dart';
import 'preview.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Preview(child: Core());
  }
}
