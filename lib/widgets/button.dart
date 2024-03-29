import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;

  const Button(
      {super.key,
      required this.text,
      required this.bgColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
      color: const Color(0xFF1F2123),
      borderRadius: BorderRadius.circular(45),
    ));
  }
}
