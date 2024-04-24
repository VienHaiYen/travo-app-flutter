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

  List<ValueNotifier<bool>> isChecked = [
    ValueNotifier<bool>(false),
    ValueNotifier<bool>(false),
    ValueNotifier<bool>(false),
    ValueNotifier<bool>(false),
  ];

  @override
  Widget build(BuildContext context) {
    int init = -1;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      body: Column(
        children: [
          MyHeader(context: context, title: "Facilities"),
          Container(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                ...items.map(
                  (e) {
                    init++;
                    return Row(
                      children: [
                        Icon(e.icon),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(child: Text(e.name)),
                        CustomCheckbox(isCheck: isChecked[init]),
                      ],
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
