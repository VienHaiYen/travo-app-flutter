import 'package:app_cyclone/travo_app_ac/enums/sort.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/custom_checkbox.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Item {
  Item({
    required this.name,
    required this.value,
  });

  String name;
  Sort value;
}

class SortBy extends StatefulWidget {
  const SortBy({super.key, required this.state});

  final Sort state;

  @override
  _SortByState createState() => _SortByState();
}

class _SortByState extends State<SortBy> {
  // Sort? _character = Sort.Earliest_Departure;
  List<Item> items = [
    Item(name: "Earliest Departure", value: Sort.Earliest_Departure),
    Item(name: "Latest Departure", value: Sort.Latest_Departure),
    Item(name: "Earliest Arrive", value: Sort.Earliest_Arrive),
    Item(name: "Latest Arrive", value: Sort.Latest_Arrive),
    Item(name: "Shortest Duration", value: Sort.Shortest_Duration),
    Item(name: "Lowest Price", value: Sort.Lowest_Price),
  ];

  @override
  Widget build(BuildContext context) {
    print(widget.state);
    final ValueNotifier<Sort> _character = ValueNotifier(widget.state);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      body: Column(
        children: [
          MyHeader(context: context, title: "SortBy"),
          Expanded(
            child: Container(
                padding: const EdgeInsets.all(40),
                child: ValueListenableBuilder<Sort>(
                    valueListenable: _character,
                    builder: (context, value, child) {
                      return Column(
                        children: <Widget>[
                          ...items.map(
                            (item) => ListTile(
                              title: Text(item.name),
                              trailing: Radio<Sort>(
                                value: item.value,
                                groupValue: _character.value,
                                onChanged: (Sort? value) {
                                  _character.value = value!;
                                },
                              ),
                            ),
                          )
                        ],
                      );
                    })),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Button(
                  text: "Done",
                  isFullWidth: true,
                  onPressed: () {
                    Navigator.pop(context, _character.value);
                  }))
        ],
      ),
    );
  }
}
