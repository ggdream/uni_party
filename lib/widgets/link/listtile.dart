import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ListTileLinkWidget extends StatelessWidget {
  const ListTileLinkWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.to,
    this.subTitle,
    this.arguments,
  }) : super(key: key);

  final String icon;
  final String title;
  final String? subTitle;
  final String to;
  final dynamic arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: PhysicalModel(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        elevation: 3,
        child: InkWell(
          onTap: () => Get.toNamed(to, arguments: arguments),
          child: ListTile(
            leading: SvgPicture.asset(icon, width: 32),
            title: Text(title),
            subtitle: subTitle == null ? null : Text(subTitle!),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
        ),
      ),
    );
  }
}
