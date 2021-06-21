import 'archive.dart';
import 'auth.dart';
import 'event.dart';
import 'helper.dart';
import 'user.dart';
import 'video.dart';

export 'client.dart';

class API with ArchiveAPI, AuthAPI, EventAPI, HelperAPI, UserAPI, VideoAPI {}
