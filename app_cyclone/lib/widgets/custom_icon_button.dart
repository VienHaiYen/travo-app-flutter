import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.icon,
      required this.color,
      required this.textColor,
      this.isFullWidth = false});

  final String text;
  final Function onPressed;
  final bool isFullWidth;
  final Color color;
  final Color textColor;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: isFullWidth ? Size(double.infinity, 50) : Size(0, 50),
      ),
      onPressed: () => {onPressed()},
      child: Row(
        children: [
          icon,
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ],
      ),
    );
  }
}
