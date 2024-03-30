import 'package:flutter/material.dart';

class CommonTextfield extends StatelessWidget {
  const CommonTextfield(
      {super.key, required this.label, required this.controller});

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.only(top: 7),
      color: Colors.white,
      child: TextField(
        controller: controller,
        autofocus: false,
        style: const TextStyle(
            fontSize: 15, color: Color.fromARGB(255, 33, 34, 34)),
        decoration: InputDecoration(
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          fillColor: Colors.white,
          hintText: '',
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 0),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(7),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      ),
    );
  }
}
