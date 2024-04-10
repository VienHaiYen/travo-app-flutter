import 'package:app_cyclone/widgets/ColorIcon.dart';
import 'package:app_cyclone/widgets/common_textfield.dart';
import 'package:flutter/material.dart';

class CommonIconTextfield extends StatelessWidget {
  const CommonIconTextfield(
      {super.key,
      required this.icon,
      required this.controller,
      this.changeable,
      required this.label});

  final Widget icon;
  final TextEditingController controller;
  final String label;
  final bool? changeable;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        children: [
          icon,
          Flexible(
            child: CommonTextfield(
                label: label, controller: controller, changeable: changeable),
          ),
        ],
      ),
    );
  }
}
