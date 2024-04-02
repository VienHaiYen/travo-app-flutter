import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PasswordTextfield extends StatefulWidget {
  PasswordTextfield({super.key, required this.controller, this.validate});
  TextEditingController controller;
  final Function(String)? validate;

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
            color: Colors.white,
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
              autofocus: false,
              obscureText: value,
              style: const TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 33, 34, 34)),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    hidePassword.value = !value;
                    if (value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Password is hidden")));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Password is visible")));
                    }
                  },
                  icon: !hidePassword.value
                      ? const Icon(Icons.remove_red_eye)
                      : const Icon(Icons.visibility_off),
                ),
                labelText: "Password",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                filled: true,
                fillColor: Colors.white,
                hintText: '',
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
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
