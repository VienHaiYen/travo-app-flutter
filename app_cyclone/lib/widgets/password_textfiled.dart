import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PasswordTextfield extends StatefulWidget {
  PasswordTextfield(
      {super.key, required this.controller, this.validate, this.autofillHints});
  TextEditingController controller;
  final Function(String)? validate;
  final Iterable<String>? autofillHints;

  @override
  _PasswordTextfieldState createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {
  // bool hidePassword = true;
  final ValueNotifier<bool> hidePassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        builder: (BuildContext context, bool value, Widget? child) {
          return Container(
            color: Theme.of(context).cardColor,
            padding: const EdgeInsets.only(top: 7),
            child: TextFormField(
              controller: widget.controller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                if (widget.validate != null) {
                  return widget.validate!(value);
                }
                return null;
              },
              autofillHints: widget.autofillHints,
              autofocus: false,
              obscureText: value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    hidePassword.value = !value;
                  },
                  icon: !hidePassword.value
                      ? const Icon(Icons.remove_red_eye)
                      : const Icon(Icons.visibility_off),
                ),
                labelText: "Password",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                filled: true,
                fillColor: Theme.of(context).cardColor,
                hintText: '',
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).cardColor),
                  borderRadius: BorderRadius.circular(7),
                ),
                enabledBorder: UnderlineInputBorder(
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
        },
        valueListenable: hidePassword);
  }
}
