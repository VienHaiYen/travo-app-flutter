import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'w1-d1/W1D1.dart';

void main() {
  runApp(const MyCupertinoApp());
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('W1-D1'),
        ),
        body: W1D1(),
      ),
    );
  }
}

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: const Text('W1-D1'),
        ),
        child: W1D1(),
      ),
    );
  }
}
