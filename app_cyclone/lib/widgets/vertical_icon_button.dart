import 'package:flutter/material.dart';

class VerticalIconButton extends StatelessWidget {
  const VerticalIconButton({
    Key? key,
    this.text,
    required this.onPressed,
    required this.color,
    this.textColor,
    required this.icon,
    this.padding,
  }) : super(key: key);

  final String? text;
  final Function onPressed;
  final Color color;
  final Color? textColor;
  final Icon icon;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
            ),
            padding: padding != null
                ? EdgeInsets.all(padding!)
                : const EdgeInsets.all(10),
            child: icon,
          ),
          const SizedBox(
            height: 10,
          ),
          text != null
              ? Text(
                  text!,
                  style: TextStyle(color: textColor),
                )
              : Container()
        ],
      ),
    );
  }
}
