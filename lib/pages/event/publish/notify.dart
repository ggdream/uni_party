import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:uni_party/components/button/button.dart';
import 'package:uni_party/styles/styles.dart';

import 'common.dart';

class EventPublishNotifyPage extends StatefulWidget {
  const EventPublishNotifyPage({Key? key}) : super(key: key);

  @override
  _EventPublishNotifyPageState createState() => _EventPublishNotifyPageState();
}

class _EventPublishNotifyPageState extends State<EventPublishNotifyPage>
    with SubmitMixin {
  final String _text = Get.arguments;

  final List<PlatformFile> _files = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: mainBody(),
      ),
    );
  }

  Widget mainBody() {
    return Column(
      children: [
        showFilesView(),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            onPressed: _selectFilesClick,
            child: Text('选择文件'),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              padding: const EdgeInsets.symmetric(vertical: 16),
              primary: ColorsX.primary,
              textStyle: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }

  Widget showFilesView() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: genWrapChildren(),
          ),
        ),
      ),
    );
  }

  List<Widget> genWrapChildren() {
    return List.generate(_files.length, (index) {
      final file = _files[index];
      return SelectedFileWidget(
        type: _judgeFileType(file.extension),
        filename: file.name,
        filesize: file.size.toString(),
        onPressed: _genDelFunc(index),
      );
    });
  }

  SelectedFileType _judgeFileType(String? suffix) {
    switch (suffix) {
      case 'zip':
        return SelectedFileType.compress;
      case 'rar':
        return SelectedFileType.compress;
      case '7z':
        return SelectedFileType.compress;
      case 'txt':
        return SelectedFileType.txt;
      case 'pdf':
        return SelectedFileType.pdf;
      case 'doc':
        return SelectedFileType.doc;
      case 'docx':
        return SelectedFileType.doc;
      case 'xls':
        return SelectedFileType.xls;
      case 'xlsx':
        return SelectedFileType.xls;
      case 'webp':
        return SelectedFileType.image;
      case 'jpg':
        return SelectedFileType.image;
      case 'jpeg':
        return SelectedFileType.image;
      case 'png':
        return SelectedFileType.image;
      case 'gif':
        return SelectedFileType.image;
      case 'svg':
        return SelectedFileType.image;
      case 'ogg':
        return SelectedFileType.audio;
      case 'mp3':
        return SelectedFileType.audio;
      case 'aac':
        return SelectedFileType.audio;
      case 'm4a':
        return SelectedFileType.audio;
      case 'mp4':
        return SelectedFileType.video;
      case 'webm':
        return SelectedFileType.video;
      case 'flv':
        return SelectedFileType.video;
      case 'mkv':
        return SelectedFileType.video;
      case 'avi':
        return SelectedFileType.video;
      default:
        return SelectedFileType.others;
    }
  }

  void Function() _genDelFunc(int index) {
    return () {
      setState(() {
        _files.removeAt(index);
      });
    };
  }

  AppBar appBar() {
    return AppBar(
      leading: BackBtn(),
      title: Text('添加附件'),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: _submitClick,
          child: Text(
            '发布',
          ),
        ),
      ],
    );
  }

  Future<void> _submitClick() async {
    final String richText = await uploadImgsAndGetText(_text);
  }

  Future<void> _selectFilesClick() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null) return;

    setState(() {
      _files.addAll(result.files);
    });
  }
}

enum SelectedFileType {
  compress,
  txt,
  pdf,
  doc,
  xls,
  image,
  audio,
  video,
  others,
}

class SelectedFileWidget extends StatelessWidget {
  const SelectedFileWidget({
    Key? key,
    required this.type,
    required this.filename,
    required this.filesize,
    required this.onPressed,
  }) : super(key: key);

  final SelectedFileType type;
  final String filename;
  final String filesize;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 108,
      height: 160,
      child: Stack(
        children: [
          visualView(context),
          actionView(),
        ],
      ),
    );
  }

  Widget actionView() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(IconImage.shanchu, width: 18),
        tooltip: '移除文件',
      ),
    );
  }

  Widget visualView(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(filename),
            duration: Duration(seconds: 1),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 不同类型文件显示不同的样式图
          fileLogoView(),
          // 显示文件的元信息
          metaInfoView(),
        ],
      ),
    );
  }

  Widget metaInfoView() {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            filename,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(filesize),
        ],
      ),
    );
  }

  Widget fileLogoView() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 108,
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        _getIconData(),
        color: _getColor(),
      ),
    );
  }

  IconData _getIconData() {
    switch (type) {
      case SelectedFileType.compress:
        return Icons.compress_rounded;
      case SelectedFileType.txt:
        return Icons.text_fields_rounded;
      case SelectedFileType.pdf:
        return Icons.text_snippet_rounded;
      case SelectedFileType.doc:
        return Icons.text_snippet_rounded;
      case SelectedFileType.xls:
        return Icons.table_chart_rounded;
      case SelectedFileType.image:
        return Icons.image_rounded;
      case SelectedFileType.audio:
        return Icons.audiotrack_rounded;
      case SelectedFileType.video:
        return Icons.videocam_rounded;
      default:
        return Icons.file_copy_rounded;
    }
  }

  Color _getColor() {
    switch (type) {
      case SelectedFileType.compress:
        return ColorsX.black;
      case SelectedFileType.txt:
        return ColorsX.black;
      case SelectedFileType.pdf:
        return ColorsX.yellowHeight;
      case SelectedFileType.doc:
        return ColorsX.blueHeight;
      case SelectedFileType.xls:
        return ColorsX.greenHeight;
      case SelectedFileType.image:
        return ColorsX.pink;
      case SelectedFileType.audio:
        return ColorsX.red;
      case SelectedFileType.video:
        return ColorsX.purple;
      default:
        return ColorsX.grey;
    }
  }

  Color _getBackgroundColor() {
    switch (type) {
      case SelectedFileType.compress:
        return ColorsX.bluePurple;
      case SelectedFileType.txt:
        return ColorsX.blackLight;
      case SelectedFileType.pdf:
        return ColorsX.yellow;
      case SelectedFileType.doc:
        return ColorsX.blueLight2;
      case SelectedFileType.xls:
        return ColorsX.greenLight;
      case SelectedFileType.image:
        return ColorsX.redLight;
      case SelectedFileType.audio:
        return ColorsX.redLight;
      case SelectedFileType.video:
        return ColorsX.purpleLight;
      default:
        return ColorsX.greyLight;
    }
  }
}
