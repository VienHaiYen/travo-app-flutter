import 'package:app_cyclone/widgets/my_header.dart';
import 'package:flutter/material.dart';

class SortBy extends StatefulWidget {
  const SortBy({Key? key}) : super(key: key);

  @override
  _SortByState createState() => _SortByState();
}

class _SortByState extends State<SortBy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [MyHeader(context: context, title: "SortBy")],
      ),
    );
  }
}
