import 'package:flutter/material.dart';

class Smalltext extends StatelessWidget {
  final String text;
  Color color;
  double size;
  double height;
  Smalltext(
      {super.key,
      required this.text,
      this.color = const Color(0xffccc7c5),
      this.height = 1.2,
      this.size = 12});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color, fontFamily: 'Roboto', fontSize: size, height: height),
    );
  }
}
