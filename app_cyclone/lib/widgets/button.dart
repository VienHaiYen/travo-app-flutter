import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.text,
      required this.onPressed,
      this.textColor,
      this.color,
      this.isFullWidth = false});

  final String text;
  final Function onPressed;
  final bool isFullWidth;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? const Color.fromARGB(143, 105, 1, 232),
        minimumSize: isFullWidth ? Size(double.infinity, 50) : Size(0, 50),
      ),
      onPressed: () => {onPressed()},
      child: Text(
        text,
        style: TextStyle(color: textColor ?? Colors.white),
      ),
    );
  }
}
