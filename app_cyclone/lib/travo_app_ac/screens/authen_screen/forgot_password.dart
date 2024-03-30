import 'package:app_cyclone/travo_app_ac/screens/authen_screen/authen_screen.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/common_textfield.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthenScreen(
      title: 'Forgot Password',
      subTitle: 'You’ll get messages soon on your e-mail address',
      form: _form(context),
    );
  }

  final TextEditingController _emailController = TextEditingController();

  Widget _form(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          CommonTextfield(label: "Email", controller: _emailController),
          const SizedBox(height: 20),
          Button(
            onPressed: () {},
            text: 'Send',
            isFullWidth: true,
          ),
        ]));
  }
}
