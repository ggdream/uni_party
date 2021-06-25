import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPublishNavCardWidget extends StatelessWidget {
  const UserPublishNavCardWidget({
    Key? key,
    required this.iconLocation,
    required this.label,
    required this.counter,
    required this.to,
    required this.color,
  }) : super(key: key);

  final String iconLocation;
  final String label;
  final int counter;
  final String to;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => Get.toNamed(to),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: mainView(),
        ),
      ),
    );
  }

  Widget mainView() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: mainContent(),
    );
  }

  Widget mainContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          iconLocation,
          width: 36,
          height: 36,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w200,
          ),
        ),
        counterView(),
      ],
    );
  }

  Widget counterView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          counter.toString(),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
        Icon(
          Icons.arrow_forward_rounded,
          size: 36,
        ),
      ],
    );
  }
}
