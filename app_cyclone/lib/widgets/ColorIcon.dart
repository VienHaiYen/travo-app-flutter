import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ColorIcon extends StatelessWidget {
  ColorIcon(
      {super.key,
      required this.icon,
      required this.color,
      required this.bgColor,
      this.name});

  IconData icon;
  Color color;
  Color bgColor;
  String? name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: bgColor,
          ),
          alignment: Alignment.center,
          child: Icon(
            icon,
            color: color,
          ),
        ),
        name != null
            ? Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    name ?? "empty",
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : Container()
      ],
    );
  }
}
