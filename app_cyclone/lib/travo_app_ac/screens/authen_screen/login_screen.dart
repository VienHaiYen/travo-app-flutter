import 'package:app_cyclone/blocs/log_in_bloc/log_in_bloc.dart';
import 'package:app_cyclone/blocs/log_in_bloc/log_in_event.dart';
import 'package:app_cyclone/blocs/log_in_bloc/log_in_state.dart';
import 'package:app_cyclone/routes/route_name.dart';
import 'package:app_cyclone/travo_app_ac/models/user_info.dart';
import 'package:app_cyclone/travo_app_ac/screens/authen_screen/authen_screen.dart';
import 'package:app_cyclone/utils/validate_string.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/common_textfield.dart';
import 'package:app_cyclone/widgets/custom_checkbox.dart';
import 'package:app_cyclone/widgets/custom_icon_button.dart';
import 'package:app_cyclone/widgets/password_textfiled.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void saveAccount(String password, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('password', password);
    prefs.setString('email', email);
  }

  Future<String?> getPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('password');
  }

  Future<String?> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }

  @override
  Widget build(BuildContext context) {
    return AuthenScreen(
      title: 'Login',
      subTitle: 'Hi, Welcome back!',
      form: _form(context),
    );
  }

  ValueNotifier<bool> notCorrectAccount = ValueNotifier<bool>(false);

  Widget _form(BuildContext context) {
    ValueNotifier<bool> isRemember = ValueNotifier<bool>(true);
    // _emailController.text= getPassword();
    // getEmail();

    return Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(children: [
            CommonTextfield(
              label: 'Email',
              controller: _emailController,
              validate: ValidateRegex.isEmail,
            ),
            const SizedBox(height: 10),
            PasswordTextfield(
              controller: _passwordController,
              validate: ValidateRegex.isPassword,
            ),
            const SizedBox(height: 10),
            ValueListenableBuilder<bool>(
                valueListenable: notCorrectAccount,
                builder: (context, value, child) => notCorrectAccount.value
                    ? Container(
                        margin: const EdgeInsets.only(left: 10),
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Email or password is incorrect',
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      )
                    : const SizedBox()),
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
            BlocBuilder<LogInBloc, LogInState>(builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Button(
                  onPressed: () async {
                    notCorrectAccount.value = false;
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    BlocProvider.of<LogInBloc>(context).add(ChangeLogInEvent(
                        isLoading: true, isSuccess: false, currentUser: null));
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

                        Future.delayed(const Duration(seconds: 0), () {
                          if (token.isNotEmpty) {
                            var currUser = UserInfo_(
                              email: _emailController.text,
                              token: token,
                            );
                            BlocProvider.of<LogInBloc>(context).add(
                                ChangeLogInEvent(
                                    isLoading: false,
                                    currentUser: currUser,
                                    isSuccess: true));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Login failed")));
                            notCorrectAccount.value = true;
                            BlocProvider.of<LogInBloc>(context).add(
                                ChangeLogInEvent(
                                    currentUser: null,
                                    isLoading: false,
                                    isSuccess: false));
                          }
                        });
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
                      }
                    } catch (e) {
                      notCorrectAccount.value = true;
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Login failed")));
                      BlocProvider.of<LogInBloc>(context).add(
                          ChangeLogInEvent(isLoading: false, isSuccess: false));
                    }
                  },
                  text: 'Log In',
                  isFullWidth: true,
                );
              }
            }),
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
          ]),
        ));
  }
}
