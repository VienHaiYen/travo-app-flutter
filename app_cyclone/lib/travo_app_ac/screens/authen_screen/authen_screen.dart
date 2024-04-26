import 'package:app_cyclone/widgets/my_header.dart';
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
      backgroundColor: Theme.of(context).backgroundColor,
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyHeader(context: context, title: title, subTitle: subTitle),
            const SizedBox(height: 20),
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
            const SizedBox(height: 50),
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
            const SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).cardColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              subTitle,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).cardColor,
              ),
            ),
          ],
        ));
  }
}
