import 'package:flutter/material.dart';

import 'app/app.dart';


Future<void> main() => initialize().then((_) => runApp(App())).catchError((e) => print(e));
