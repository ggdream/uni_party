import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_party/pages/event/text_editor/controller.dart';
import 'package:uni_party/widgets/button/button.dart';

import 'package:uni_party/widgets/snackbar/snackbar.dart';
import 'package:uni_party/logic/logic.dart';
import 'package:uni_party/router/router.dart';

import 'previewer.dart';
import 'editor.dart';

class FileEditorPage extends StatefulWidget {
  const FileEditorPage({
    Key? key,
  }) : super(key: key);

  @override
  _FileEditorPageState createState() => _FileEditorPageState();
}

class _FileEditorPageState extends State<FileEditorPage>
    with SingleTickerProviderStateMixin {
  late final _tabController;
  final key = GlobalKey();

  final EventPublishType _type = Get.arguments;

  @override
  void initState() {
    super.initState();
    Get.put(TextController());
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      switch (_tabController.index) {
        case 1:
          if (key.currentState == null) return;
          key.currentState!.setState(() {});
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: appBar(),
        body: TabBarView(
          controller: _tabController,
          children: [EditorView(), PreviewerView(key: key)],
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: BackBtn(),
      title: Text('编辑文本'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: _nextStepClick,
          icon: Icon(Icons.next_plan_rounded),
          tooltip: '下一步',
        ),
      ],
      bottom: TabBar(
        controller: _tabController,
        indicatorColor: Colors.black,
        tabs: [
          Tab(text: '编辑'),
          Tab(text: '预览'),
        ],
      ),
    );
  }

  Future<void> _nextStepClick() async {
    print(_type);
    switch (_type) {
      case EventPublishType.notice:
        await Get.toNamed(RoutesNamespace.EventPublishNotify);
        break;
      case EventPublishType.vote:
        await Get.toNamed(RoutesNamespace.EventPublishVote);
        break;
      case EventPublishType.sortition:
        await Get.toNamed(RoutesNamespace.EventPublishRandom);
        break;
      case EventPublishType.participation:
        await Get.toNamed(RoutesNamespace.EventPublishApply);
        break;
      default:
        SnackBarX.showRaw(context, '消息类型错误，请重新打开本页面进行编辑');
        return;
    }
  }
}
