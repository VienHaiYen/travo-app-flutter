import 'package:app_cyclone/widgets/custom_checkbox.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  List<Item> items = [
    Item(icon: Icons.wifi, name: "Wifi"),
    Item(icon: Icons.luggage, name: "Baggage"),
    Item(icon: Icons.power, name: "Power / USB Port"),
    Item(icon: Icons.restaurant, name: "In-Flight Meal"),
  ];

  ValueNotifier<bool> wifi = ValueNotifier<bool>(false);
  ValueNotifier<bool> luggage = ValueNotifier<bool>(false);
  ValueNotifier<bool> power = ValueNotifier<bool>(false);
  ValueNotifier<bool> restaurant = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      body: Column(
        children: [
          MyHeader(context: context, title: "Facilities"),
          Container(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                ...items.map((e) => _buildItem(e, wifi)).toList(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItem(Item item, ValueNotifier<bool> isChecked) {
    return Row(
      children: [
        Icon(item.icon),
        const SizedBox(
          width: 20,
        ),
        Expanded(child: Text(item.name)),
        CustomCheckbox(isCheck: isChecked),
      ],
    );
  }
}
