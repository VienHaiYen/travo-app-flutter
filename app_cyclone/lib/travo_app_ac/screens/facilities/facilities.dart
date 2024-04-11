import 'package:app_cyclone/widgets/my_header.dart';
import 'package:flutter/material.dart';

class Facilities extends StatefulWidget {
  const Facilities({Key? key}) : super(key: key);

  @override
  _FacilitiesState createState() => _FacilitiesState();
}

class Item {
  Item({required this.icon, required this.name});

  String name;
  IconData icon;
}

class _FacilitiesState extends State<Facilities> {
  List<Item> item = [
    Item(icon: Icons.wifi, name: "Wifi"),
    Item(icon: Icons.luggage, name: "Baggage"),
    Item(icon: Icons.power, name: "Power / USB Port"),
    Item(icon: Icons.restaurant, name: "In-Flight Meal"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [MyHeader(context: context, title: "Facilities")],
      ),
    );
  }
}
