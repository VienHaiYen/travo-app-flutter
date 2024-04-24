import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomRadio extends StatefulWidget {
  CustomRadio({super.key, required this.isCheck, required this.site});
  ValueNotifier<bool> isCheck;
  String site;

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: widget.isCheck,
        builder: (BuildContext context, bool value, Widget? child) {
          return Radio(
            groupValue: widget.site,
            value: widget.isCheck.value,
            onChanged: (value) {
              print(value);
              widget.site = value.toString();
            },
          );
        });
  }
}
