import 'package:flutter/material.dart';

class MyHeader extends StatelessWidget {
  const MyHeader(
      {super.key, required this.context, required this.title, this.subTitle});

  final BuildContext context;
  final String title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
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
            Navigator.canPop(context)
                ? Align(
                    alignment: Alignment.topLeft,
                    child: FloatingActionButton(
                      mini: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back),
                    ),
                  )
                : Container(),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            subTitle == null
                ? Container()
                : Text(
                    subTitle ?? "",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
          ],
        ));
  }
}
