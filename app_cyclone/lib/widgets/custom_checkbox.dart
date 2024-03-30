import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCheckbox extends StatefulWidget {
  CustomCheckbox({super.key, required this.isCheck});
  ValueNotifier<bool> isCheck;

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: widget.isCheck,
        builder: (BuildContext context, bool value, Widget? child) {
          return Checkbox(
            value: widget.isCheck.value,
            onChanged: (value_) {
              widget.isCheck.value = value_!;
            },
          );
        });
  }
}
