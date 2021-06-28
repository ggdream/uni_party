import 'package:flutter/material.dart';

class VideoUploadPage extends StatefulWidget {
  const VideoUploadPage({Key? key}) : super(key: key);

  @override
  _VideoUploadPageState createState() => _VideoUploadPageState();
}

class _VideoUploadPageState extends State<VideoUploadPage> {
  bool dropBGM = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: DecoratedBox(
        decoration: BoxDecoration(color: Color(0xff252836)),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.black,
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Text('sss'),
                      ),
                      // Container(
                      //   margin: const EdgeInsets.symmetric(horizontal: 36),
                      //   width: double.infinity,
                      //   child: ElevatedButton(
                      //     onPressed: _selectVideo,
                      //     child: Text('选择视频'),
                      //   ),
                      // ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: kBottomNavigationBarHeight * 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleActionBtn(
                      child: Icon(Icons.timelapse_rounded),
                      message: '时长调整',
                      onTap: () {},
                    ),
                    CircleActionBtn(
                      child: Icon(Icons.library_music_rounded),
                      message: '添加背景音乐',
                      onTap: () {},
                    ),
                    ifDropBGMBtn(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ifDropBGMBtn() {
    return dropBGM
        ? CircleActionBtn(
            child: Icon(Icons.music_off_rounded),
            message: '保留视频原有背景声音',
            onTap: _dropBGMofVideo,
          )
        : CircleActionBtn(
            child: Icon(Icons.music_note_rounded),
            message: '关闭视频原有背景声音',
            onTap: _dropBGMofVideo,
          );
  }

  void _dropBGMofVideo() {
    setState(() {
      dropBGM = !dropBGM;
    });
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.black,
      leading: BackButton(
        color: Colors.white,
      ),
      title: Text(
        '视频处理',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            '下一步',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class CircleActionBtn extends StatelessWidget {
  const CircleActionBtn({
    Key? key,
    required this.child,
    required this.message,
    this.onTap,
  }) : super(key: key);

  final Widget child;
  final String message;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Tooltip(
        message: message,
        child: CircleAvatar(
          child: child,
        ),
      ),
    );
  }
}
