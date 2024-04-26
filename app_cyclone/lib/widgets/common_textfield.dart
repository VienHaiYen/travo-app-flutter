import 'package:flutter/material.dart';

class CommonTextfield extends StatelessWidget {
  CommonTextfield(
      {super.key,
      this.label,
      required this.controller,
      this.changeable,
      this.validate,
      this.autofillHints,
      this.keyboardType});

  final String? label;
  final TextEditingController controller;
  final Function(String)? validate;
  final bool? changeable;
  final Iterable<String>? autofillHints;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.only(top: 7),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        keyboardType: keyboardType ?? TextInputType.text,
        controller: controller,
        enabled: changeable ?? true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          if (validate != null) {
            return validate!(value);
          }
          return null;
        },
        autofillHints: autofillHints,
        autofocus: false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        decoration: InputDecoration(
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          fillColor: Theme.of(context).cardColor,
          hintText: '',
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).cardColor),
            borderRadius: BorderRadius.circular(7),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).cardColor),
            borderRadius: BorderRadius.circular(7),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).cardColor),
            borderRadius: BorderRadius.circular(7),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      ),
    );
  }
}
