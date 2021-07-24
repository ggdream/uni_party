import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:uni_party/styles/styles.dart';

class SexView extends StatelessWidget {
  const SexView({
    Key? key,
    required this.isMan,
  }) : super(key: key);

  final bool isMan;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      isMan ? IconImage.nanxing : IconImage.nvxing,
      color: isMan ? ColorsX.blue : ColorsX.red,
      width: 16,
    );
  }
}
