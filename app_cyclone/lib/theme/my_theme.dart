import 'package:flutter/material.dart';

class MyTheme {
  static final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: Colors.blue[600],
    brightness: Brightness.light,
    backgroundColor: const Color.fromARGB(255, 244, 244, 244),
    cardColor: Colors.white,
    fontFamily: 'Karla',
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
  static final darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: Colors.blue[300],
    brightness: Brightness.dark,
    backgroundColor: const Color.fromARGB(255, 82, 82, 82),
    cardColor: Colors.black,
    fontFamily: 'Karla',
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
