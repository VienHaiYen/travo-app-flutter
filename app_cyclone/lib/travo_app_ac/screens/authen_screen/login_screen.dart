import 'package:app_cyclone/travo_app_ac/screens/authen_screen/authen_screen.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/custom_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return AuthenScreen(
      title: 'Login',
      subTitle: 'Hi, Welcome back!',
      form: _form(context),
    );
  }

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  bool hidePassword = true;
  bool remember = true;

  // ValueListenable<bool> rememberMe = ValueNotifier<bool>(true);
  // ValueListenable<bool> _hide = ValueNotifier<bool>(true);

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
          SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Checkbox(
                    value: remember,
                    onChanged: (value) {
                      setState(() {
                        remember = value!;
                      });
                    }),
                Text('Remember me'),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/forgot-password');
              },
              child: Text(
                'Forgot password?',
                style: TextStyle(color: Colors.purple),
              ),
            )
          ]),
          Button(
            onPressed: () {},
            text: 'Log In',
            isFullWidth: true,
          ),
          SizedBox(height: 30),
          Text('or log in with'),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconButton(
                  text: "Google",
                  onPressed: () {},
                  icon: Icon(
                    Icons.mail,
                    color: Colors.black,
                  ),
                  color: Colors.white,
                  textColor: Colors.black),
              SizedBox(width: 20),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don\'t have an account?'),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/sign-up');
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Color.fromARGB(255, 14, 90, 148)),
                ),
              )
            ],
          )
        ]));
  }
}
