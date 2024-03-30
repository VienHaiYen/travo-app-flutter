import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:app_cyclone/travo_app_ac/screens/authen_screen/authen_screen.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/common_textfield.dart';
import 'package:app_cyclone/widgets/custom_dropdown_button.dart';
import 'package:app_cyclone/widgets/custom_icon_button.dart';
import 'package:app_cyclone/widgets/password_textfiled.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return AuthenScreen(
      title: 'Sign Up',
      subTitle: 'Hi, Welcome back!',
      form: _form(context),
    );
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final ValueNotifier<String> _countryController = ValueNotifier<String>('US');
  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final List<String> _countries = [
    "US",
    "Vietnam",
  ];

  Widget _form(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          CommonTextfield(label: "Name", controller: _nameController),
          const SizedBox(height: 20),
          CustomDropdownButton(
            items: _countries,
            label: "Country",
            selectItem: _countryController,
          ),
          const SizedBox(height: 20),
          CommonTextfield(label: "Phone number", controller: _phoneController),
          const SizedBox(height: 20),
          CommonTextfield(label: "Email", controller: _emailController),
          const SizedBox(height: 20),
          PasswordTextfield(controller: _passwordController),
          const SizedBox(height: 20),
          const SizedBox(height: 20),
          const Text(
              'By tapping sign up you agree to the Terms and Condition and Privacy Policy of this app',
              textAlign: TextAlign.center),
          const SizedBox(height: 20),
          Button(
            onPressed: () async {
              try {
                User? user = (await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text))
                    .user;
                if (user != null) {
                  await FirebaseAuth.instance.currentUser
                      ?.updateProfile(displayName: user.displayName);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Sign up successfully')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Failed')),
                  );
                }
              } catch (e) {
                print(e);
                _emailController.text = "";
                _passwordController.text = "";
              }
            },
            text: 'Sign Up',
            isFullWidth: true,
          ),
          const SizedBox(height: 30),
          const Text('or sign up with'),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconButton(
                  text: "Google",
                  onPressed: () {},
                  icon: const Icon(
                    Icons.mail,
                    color: Colors.black,
                  ),
                  color: Colors.white,
                  textColor: Colors.black),
              const SizedBox(width: 20),
              CustomIconButton(
                  text: "Facebook",
                  onPressed: () {},
                  icon: const Icon(
                    Icons.facebook_sharp,
                    color: Colors.white,
                  ),
                  color: const Color.fromARGB(255, 21, 98, 161),
                  textColor: Colors.white),
            ],
          ),
          const SizedBox(height: 20),
        ]));
  }
}
