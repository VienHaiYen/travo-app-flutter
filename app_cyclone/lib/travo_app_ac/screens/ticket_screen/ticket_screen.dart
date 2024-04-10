import 'package:app_cyclone/travo_app_ac/models/flight.dart';
import 'package:app_cyclone/travo_app_ac/screens/flight_screen/flight_screen.dart';
import 'package:app_cyclone/travo_app_ac/service/flight_service.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:app_cyclone/widgets/ticket_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TicketScreen extends StatelessWidget {
  TicketScreen({Key? key}) : super(key: key);
  final ValueNotifier<List<Flight>> _flights = ValueNotifier<List<Flight>>([]);

  getFlight() async {
    _flights.value = await FlightService.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    getFlight();
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        body: Column(children: [
          MyHeader(
            context: context,
            title: 'Review',
          ),
          Expanded(
            child: ValueListenableBuilder<List<Flight>>(
                valueListenable: _flights,
                builder: (context, value, child) {
                  return ListView.builder(
                      physics: const ScrollPhysics(),
                      itemCount: _flights.value.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TicketListItem(
                          item: _flights.value[index],
                        );
                      });
                }),
          ),
        ]));
  }
}
