import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'w1-d1/W1D1.dart';
import 'w1-d2/W1D2.dart';

void main() {
  runApp(const MyMaterialApp());
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('W1-D2'),
        ),
        body: W1D2(),
      ),
    );
  }
}
