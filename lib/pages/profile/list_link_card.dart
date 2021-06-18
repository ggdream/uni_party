import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_party/styles/color.dart';

class ListLinkCardWidget extends StatelessWidget {
  const ListLinkCardWidget({
    Key? key,
    required this.label,
    required this.image,
    required this.to,
  }) : super(key: key);

  final String label;
  final String image;
  final String to;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        onTap: () => Get.toNamed(to),
        behavior: HitTestBehavior.opaque,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: PhysicalModel(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    image,
                    width: 32,
                    height: 32,
                  ),
                  SizedBox(width: 12),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 18,
                      color: ColorsX.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
