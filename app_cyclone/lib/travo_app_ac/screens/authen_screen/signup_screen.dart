import 'dart:async';
import 'dart:ui';
import 'package:app_cyclone/travo_app_ac/models/account_info.dart';
import 'package:app_cyclone/travo_app_ac/service/account_service.dart';
import 'package:app_cyclone/utils/validate_string.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:app_cyclone/travo_app_ac/screens/authen_screen/authen_screen.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/common_textfield.dart';
import 'package:app_cyclone/widgets/custom_dropdown_button.dart';
import 'package:app_cyclone/widgets/custom_icon_button.dart';
import 'package:app_cyclone/widgets/password_textfiled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  StreamController<String> _signUpStreamController = StreamController<String>();

  @override
  void dispose() {
    super.dispose();
    _signUpStreamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return AuthenScreen(
      title: 'Sign Up',
      subTitle: 'Hi, Welcome back!',
      form: _form(context),
    );
  }

  Future<void> _signUp() async {
    try {
      User? user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text))
          .user;

      if (user != null) {
        await FirebaseAuth.instance.currentUser
            ?.updateProfile(displayName: user.displayName);
      }
      _signUpStreamController.add("Success");
    } catch (e) {
      // print(e);
      _signUpStreamController.addError(e.toString());
      throw FirebaseAuthException(message: e.toString(), code: 'login_failed');
    }
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final ValueNotifier<String> _countryController = ValueNotifier<String>('US');
  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final List<String> _countries = [
    "US",
    "Vietnam",
  ];

  void addAccount(AccountInfo acc) async {
    // acc.value = await AccountService.fetchData(user!.email);
    AccountService.addDataToFirestore(acc.toMap());
  }

  Widget _form(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(children: [
            CommonTextfield(
              label: "Name",
              controller: _nameController,
              validate: ValidateRegex.isName,
            ),
            const SizedBox(height: 20),
            CustomDropdownButton(
              items: _countries,
              label: "Country",
              selectItem: _countryController,
            ),
            const SizedBox(height: 20),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(top: 9),
              child: IntlPhoneField(
                controller: _phoneController,
                showCountryFlag: false,
                validator: (value) {
                  if (value!.number.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.always,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color.fromARGB(255, 33, 34, 34)),
                decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )),
                initialCountryCode: 'EN',
              ),
            ),
            const SizedBox(height: 20),
            CommonTextfield(
              label: "Email",
              controller: _emailController,
              validate: ValidateRegex.isEmail,
            ),
            const SizedBox(height: 20),
            PasswordTextfield(
              controller: _passwordController,
              validate: ValidateRegex.isPassword,
            ),
            const SizedBox(height: 20),
            const Text(
                'By tapping sign up you agree to the Terms and Condition and Privacy Policy of this app',
                textAlign: TextAlign.center),
            const SizedBox(height: 10),
            Button(
              onPressed: () async {
                if (!_formKey.currentState!.validate() ||
                    _phoneController.text == "") {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Please fill all fields'),
                  ));
                  return;
                }

                _signUpStreamController.add("waiting");
                _signUp();
              },
              text: 'Sign Up',
              isFullWidth: true,
            ),
            StreamBuilder<String>(
              stream: _signUpStreamController.stream,
              builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container();
                } else if (snapshot.hasError) {
                  return Text('Đã xảy ra lỗi: ${snapshot.error}',
                      style: const TextStyle(color: Colors.red));
                } else if (snapshot.data == "waiting") {
                  return const CircularProgressIndicator();
                } else if (snapshot.data == "Success") {
                  addAccount(AccountInfo(
                      avatar: "",
                      country: _countryController.value,
                      email: _emailController.text,
                      name: _nameController.text,
                      phone: _phoneController.text));
                  return const Text('Đăng ký thành công:');
                } else {
                  return const Text('Unknown error!',
                      style: TextStyle(color: Colors.red));
                }
              },
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
          ]),
        ));
  }
}
