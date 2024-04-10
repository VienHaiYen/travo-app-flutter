import 'dart:ffi';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropdownButton extends StatefulWidget {
  CustomDropdownButton(
      {super.key, required this.items, this.label, required this.selectItem});

  final List<String> items;
  final String? label;
  ValueNotifier<String> selectItem;

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(BuildContext context) {
    widget.selectItem.value = widget.items.first;
    return ValueListenableBuilder(
      valueListenable: widget.selectItem,
      builder: (context, value, child) => Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        width: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label ?? '',
              style: const TextStyle(fontSize: 12),
            ),
            DropdownButton<String>(
              underline: Container(),
              disabledHint: Text(
                widget.label ?? '',
                style: const TextStyle(fontSize: 12),
              ),
              hint: Text(
                widget.label ?? '',
                style: const TextStyle(fontSize: 12),
              ),
              isExpanded: true,
              value: widget.selectItem.value,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
              onChanged: (String? value_) {
                widget.selectItem.value = value_!;
              },
              items: widget.items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
