import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backGroundColor;
  final Color iconColor;
  final double size;
  final double iconSize;

  const AppIcon(
      {super.key,
      required this.icon,
      this.backGroundColor = const Color(0xfffcf4e4),
      this.iconColor = const Color(0xff756d54),
      this.iconSize = 16,
      this.size = 40});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          color: backGroundColor),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
