import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHeader extends StatelessWidget {
  const MyHeader(
      {super.key,
      required this.context,
      this.topWidget,
      this.title,
      this.subTitle,
      this.stepLine,
      this.rightButton});

  final BuildContext context;
  final Widget? topWidget;
  final String? title;
  final String? subTitle;
  final Widget? stepLine;
  final Widget? rightButton;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                rightButton ?? Container()
              ],
            ),
            const SizedBox(height: 20),
            topWidget ?? Container(),
            title == null
                ? Container()
                : Text(
                    title!,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.montserrat().fontFamily,
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
            stepLine ?? Container()
          ],
        ));
  }
}
