import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';

class VideoUploadPage extends StatefulWidget {
  const VideoUploadPage({Key? key}) : super(key: key);

  @override
  _VideoUploadPageState createState() => _VideoUploadPageState();
}

class _VideoUploadPageState extends State<VideoUploadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _selectVideo,
            icon: Icon(Icons.cloud_upload_outlined),
          ),
        ],
      ),
    );
  }

  Future<void> _selectVideo() async {
    List<Media>? video = await ImagesPicker.pick(pickType: PickType.video);
    if (video == null) return;
    print(video[0].path);
  }
}
