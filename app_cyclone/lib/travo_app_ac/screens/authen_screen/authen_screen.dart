import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthenScreen extends StatelessWidget {
  const AuthenScreen(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.form});

  final String title;
  final String subTitle;
  final Widget form;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 244, 244),
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header(
              title: title,
              subTitle: subTitle,
              context: context,
            ),
            SizedBox(height: 20),
            // _loginForm(),
            form,
          ],
        ),
      ),
    );
  }

  Widget _header(
      {required BuildContext context,
      required String title,
      required String subTitle}) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 210,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/authen_banner.jpg'),
              repeat: ImageRepeat.noRepeat,
              fit: BoxFit.fitWidth),
        ),
        child: Column(
          children: [
            SizedBox(height: 50),
            Align(
              alignment: Alignment.topLeft,
              child: FloatingActionButton(
                mini: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back),
              ),
            ),
            SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              subTitle,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ));
  }
}
