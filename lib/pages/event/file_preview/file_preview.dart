import 'package:flutter/material.dart';
import 'package:flutter_filereader/flutter_filereader.dart';

class EventFilePreviewPage extends StatelessWidget {
  const EventFilePreviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FileReaderView(
        filePath: 'https://raw.githubusercontent.com/ggdream/exercise/main/%E7%94%9F%E4%BA%A7%E5%AE%9E%E4%B9%A0%E6%8A%A5%E5%91%8A.docx',
      ),
    );
  }
}
