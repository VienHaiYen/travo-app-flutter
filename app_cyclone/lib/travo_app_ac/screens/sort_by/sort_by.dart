import 'package:app_cyclone/travo_app_ac/enums/sort.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/custom_checkbox.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  @override
  Widget build(BuildContext context) {
    List<Item> items = [
      Item(
          name: AppLocalizations.of(context)!.earliest_Departure,
          value: Sort.Earliest_Departure),
      Item(
          name: AppLocalizations.of(context)!.latest_Departure,
          value: Sort.Latest_Departure),
      Item(
          name: AppLocalizations.of(context)!.earliest_Arrive,
          value: Sort.Earliest_Arrive),
      Item(
          name: AppLocalizations.of(context)!.latest_Arrive,
          value: Sort.Latest_Arrive),
      Item(
          name: AppLocalizations.of(context)!.shortest_Duration,
          value: Sort.Shortest_Duration),
      Item(
          name: AppLocalizations.of(context)!.lowest_Price,
          value: Sort.Lowest_Price),
    ];
    final ValueNotifier<Sort> _character = ValueNotifier(widget.state);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
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
