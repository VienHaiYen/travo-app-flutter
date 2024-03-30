import 'package:app_cyclone/providers/auth_provider.dart';
import 'package:app_cyclone/routes/route_name.dart';
import 'package:app_cyclone/travo_app_ac/models/user_info.dart';
import 'package:app_cyclone/travo_app_ac/screens/authen_screen/authen_screen.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/common_textfield.dart';
import 'package:app_cyclone/widgets/custom_checkbox.dart';
import 'package:app_cyclone/widgets/custom_icon_button.dart';
import 'package:app_cyclone/widgets/password_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:app_cyclone/travo_app_ac/models/user_info.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<MyAuthProvider>();
    return AuthenScreen(
      title: 'Login',
      subTitle: 'Hi, Welcome back!',
      form: _form(context, authProvider),
    );
  }

  Widget _form(BuildContext context, MyAuthProvider authProvider) {
    ValueNotifier<bool> isRemember = ValueNotifier<bool>(true);
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          CommonTextfield(label: 'Email', controller: _emailController),
          PasswordTextfield(controller: _passwordController),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                CustomCheckbox(isCheck: isRemember),
                const Text(
                  'Remember me',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/forgot-password');
              },
              child: const Text(
                'Forgot password?',
                style: TextStyle(color: Colors.purple, fontSize: 12),
              ),
            )
          ]),
          const SizedBox(height: 20),
          Button(
            onPressed: () async {
              try {
                User? user = (await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text
                            // email: "wifevim707@mnsaf.com",
                            // password: "123456"
                            ))
                    .user;
                String token = "";

                user?.getIdToken().then((result) {
                  token = result.toString();
                  if (token.length > 0) {
                    var currUser = UserInfo_(email: _emailController.text);
                    authProvider.logIn(currUser, token);
                  }
                  // print(token);
                });
                print(token);

                if (user != null) {
                  print("Login");
                  Navigator.of(context).pushNamed('/home');
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteName.home,
                    (route) => false,
                  );
                } else {
                  // print("failed");
                }
              } catch (e) {
                print(e);
                // _emailController.text = "";
                // _passwordController.text = "";
              }
            },
            text: 'Log In',
            isFullWidth: true,
          ),
          const SizedBox(height: 30),
          const Text('or log in with'),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Don\'t have an account?'),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/sign-up');
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(color: Color.fromARGB(255, 14, 90, 148)),
                ),
              )
            ],
          )
        ]));
  }
}
