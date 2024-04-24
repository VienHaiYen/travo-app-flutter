import 'package:app_cyclone/widgets/custom_checkbox.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SortBy extends StatefulWidget {
  const SortBy({Key? key}) : super(key: key);

  @override
  _SortByState createState() => _SortByState();
}

class Item {
  Item({required this.name});

  String name;
}

class _SortByState extends State<SortBy> {
  List<Item> items = [
    Item(name: "Earliest Departure"),
    Item(name: "Latest Departure"),
    Item(name: "Earliest Arrive"),
    Item(name: "Latest ArriveMeal"),
    Item(name: "Shortest Duration"),
    Item(name: "Lowest Price"),
    Item(name: "Highest popularity"),
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
          MyHeader(context: context, title: "SortBy"),
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
        Expanded(child: Text(item.name)),
        CustomCheckbox(isCheck: isChecked),
      ],
    );
  }
}

enum SingingCharacter { lafayette, jefferson }

class RadioExample extends StatefulWidget {
  const RadioExample({super.key});

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Lafayette'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.lafayette,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Thomas Jefferson'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.jefferson,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
