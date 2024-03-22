import 'package:app_cyclone/travo_app_ac/screens/authen_screen/authen_screen.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/custom_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  bool hidePassword = true;

  Widget _form(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          inputTextField('Name'),
          const SizedBox(height: 20),
          inputTextField('Country'),
          const SizedBox(height: 20),
          inputTextField('Phone number'),
          const SizedBox(height: 20),
          inputTextField('Email'),
          const SizedBox(height: 20),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 5),
            child: TextField(
              autofocus: false,
              obscureText: hidePassword,
              style: TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 33, 34, 34)),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  icon: !hidePassword
                      ? Icon(Icons.remove_red_eye)
                      : Icon(Icons.visibility_off),
                ),
                labelText: "Password",
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
          const SizedBox(height: 20),
          const SizedBox(height: 20),
          const Text(
              'By tapping sign up you agree to the Terms and Condition and Privacy Policy of this app',
              textAlign: TextAlign.center),
          const SizedBox(height: 20),
          Button(
            onPressed: () {},
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
                  icon: Icon(
                    Icons.facebook_sharp,
                    color: Colors.white,
                  ),
                  color: const Color.fromARGB(255, 21, 98, 161),
                  textColor: Colors.white),
            ],
          ),
          SizedBox(height: 20),
        ]));
  }

  Widget inputTextField(String text) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 5),
      child: TextField(
        obscureText: true,
        autofocus: false,
        style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 33, 34, 34)),
        decoration: InputDecoration(
          labelText: text,
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
    );
  }
}
