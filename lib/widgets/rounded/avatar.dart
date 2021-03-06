import 'package:flutter/material.dart';

class RoundedAvatar extends StatelessWidget {
  const RoundedAvatar({
    Key? key,
    this.size,
    this.margin,
    required this.image,
  }) : super(key: key);

  RoundedAvatar.asset(
    String name, {
    Key? key,
    double? size,
    EdgeInsetsGeometry? margin,
  }) : this(size: size, margin: margin, image: AssetImage(name));

  RoundedAvatar.network(
    String url, {
    Key? key,
    double? size,
    EdgeInsetsGeometry? margin,
  }) : this(size: size, margin: margin, image: NetworkImage(url));

  final double? size;
  final EdgeInsetsGeometry? margin;
  final ImageProvider<Object> image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: margin,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: image,
        ),
      ),
    );
  }
}
