import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:uni_party/widgets/button/button.dart';
import 'package:uni_party/styles/styles.dart';
import 'package:uni_party/tools/hex_color/hex_color.dart';

class HelperSettingsThemePage extends StatefulWidget {
  const HelperSettingsThemePage({Key? key}) : super(key: key);

  @override
  _HelperSettingsThemePageState createState() =>
      _HelperSettingsThemePageState();
}

class _HelperSettingsThemePageState extends State<HelperSettingsThemePage> {
  final List<Color> _colors = [
    Colors.red,
    Colors.pink[300]!,
    Colors.purple[900]!,
    Colors.deepPurple,
    Colors.deepPurple[400]!,
    Colors.indigo,
    Colors.blue,
    Colors.yellow[200]!,
    Colors.teal,
    Colors.teal[400]!,
    Colors.green,
    Colors.brown,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: bodyView(),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: _colors[_selectedIndex],
      leading: BackBtn(),
      title: Text('主题色设置'),
      centerTitle: true,
      actions: [
        Container(
          margin: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {},
            child: Text('保存'),
          ),
        ),
      ],
    );
  }

  Widget bodyView() {
    return GridView.builder(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        crossAxisCount: 6,
      ),
      itemCount: _colors.length,
      itemBuilder: (BuildContext context, int index) {
        return selectedColorWidget(_colors[index], index);
      },
    );
  }

  Widget selectedColorWidget(Color color, int index) {
    return PhysicalModel(
      elevation: 3,
      borderRadius: BorderRadius.circular(16),
      color: color,
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Stack(
          children: [
            SizedBox(),
            statusView(index),
          ],
        ),
      ),
    );
  }

  Widget statusView(int index) {
    return _selectedIndex == index
        ? Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              IconImage.dagou,
              width: 16,
              color: Colors.white,
            ),
          )
        : SizedBox();
  }
}
