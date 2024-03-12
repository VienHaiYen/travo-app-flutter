import 'package:app_cyclone/w2-d1/W2D1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import "package:go_router/go_router.dart";
import 'w1-d1/W1D1.dart';
import 'w1-d2/W1D2.dart';
import 'w1-d3/W1D3.dart';

void main() {
  runApp(const MyMaterialApp());
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Workshop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const W2D1(),
    );
  }
}
