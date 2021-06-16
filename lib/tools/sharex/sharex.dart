import 'package:share_plus/share_plus.dart';

class ShareX {
  static Future<void> text(String data, {String? subject}) async {
    await Share.share(data, subject: subject);
  }

  static Future<void> file(
    String path, {
    String? subject,
    String? text,
  }) async {
    await files(
      [path],
      subject: subject,
      text: text,
    );
  }

  static Future<void> files(
    List<String> paths, {
    List<String>? mimeTypes,
    String? subject,
    String? text,
  }) async {
    await Share.shareFiles(
      paths,
      mimeTypes: mimeTypes,
      subject: subject,
      text: text,
    );
  }
}
