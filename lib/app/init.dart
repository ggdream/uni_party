import 'package:uni_party/api/api.dart';
import 'package:uni_party/tools/notify/notify.dart';

Future<void> initialize() async {

  BaseClient.init();
}

Future<void> initializeLate() async {
  AppNotify.init();
}
