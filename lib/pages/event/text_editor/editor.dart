import 'package:flutter/material.dart';

import 'controller.dart';

/// 编辑器区域
class EditorView extends StatelessWidget {
  const EditorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: coreView(context),
      bottomNavigationBar: bottomView(context),
    );
  }

  BottomNavigationBar bottomView(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      selectedLabelStyle: TextStyle(color: Colors.black),
      unselectedLabelStyle: TextStyle(color: Colors.black),
      type: BottomNavigationBarType.fixed,
      items: _bottomItemList(),
      onTap: (int index) async {
        await TextController.to.handle(context, index);
      },
    );
  }

  List<BottomNavigationBarItem> _bottomItemList() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.image_rounded), label: '本地图片'),
      BottomNavigationBarItem(
        icon: Icon(Icons.cloud_circle_rounded),
        label: '网络图片',
      ),
      BottomNavigationBarItem(icon: Icon(Icons.wifi_rounded), label: '网络链接'),
      BottomNavigationBarItem(icon: Icon(Icons.lightbulb_outline_rounded), label: '强调字段'),
      BottomNavigationBarItem(icon: Icon(Icons.title_rounded), label: '一级标题'),
      BottomNavigationBarItem(icon: Icon(Icons.code_rounded), label: '代码片段'),
    ];
  }

  Widget coreView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Theme(
        data: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.black,
            selectionColor: Theme.of(context).primaryColor,
          ),
        ),
        child: textFieldView(),
      ),
    );
  }

  Widget textFieldView() {
    return TextField(
      maxLines: null,
      keyboardType: TextInputType.multiline,
      controller: TextController.to.controller,
      decoration: _inputDecoration(),
      scrollPhysics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      hintText: '在这里输入内容...',
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
    );
  }
}
