import 'package:flutter/material.dart';

class RoundedAvatar extends StatelessWidget {
  const RoundedAvatar({
    Key? key,
    this.size,
    required this.image,
  }) : super(key: key);

  RoundedAvatar.asset(
    String name, {
    Key? key,
    double? size,
  }) : this(size: size, image: AssetImage(name));

  RoundedAvatar.network(
    String url, {
    Key? key,
    double? size,
  }) : this(size: size, image: NetworkImage(url));

  final double? size;
  final ImageProvider<Object> image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
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
