import 'package:app_cyclone/travo_app_ac/screens/authen_screen/authen_screen.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/custom_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthenScreen(
      title: 'Forgot Password',
      subTitle: 'You’ll get messages soon on your e-mail address',
      form: _form(context),
    );
  }

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Widget _form(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 5),
            child: TextField(
              autofocus: false,
              style: const TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 33, 34, 34)),
              decoration: InputDecoration(
                labelText: "Email",
                filled: true,
                fillColor: Colors.white,
                hintText: '',
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Button(
            onPressed: () {},
            text: 'Send',
            isFullWidth: true,
          ),
        ]));
  }
}
