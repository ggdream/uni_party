import 'package:flutter/material.dart';

import 'app/app.dart';

Future<void> main() async {
  await initialize();

  runApp(App());

  await initializeLate();
}
