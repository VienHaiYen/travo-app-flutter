import 'package:app_cyclone/travo_app_ac/models/flight.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class TicketListItem extends StatelessWidget {
  const TicketListItem({super.key, required this.item});

  final Flight item;

  static const airlineImg = {
    'LionAir': 'assets/images/lion_air.png',
    'BatikAir': 'assets/images/batik_air.png',
    'Citilink': 'assets/images/citillink.png',
    'Garuna': 'assets/images/garuda.png',
    'AirAsia': 'assets/images/air_asia.png',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
      height: 120,
      color: Colors.white,
      child: Row(
        children: [
          Container(
              height: double.infinity,
              width: 120,
              padding: const EdgeInsets.all(10),
              child: Image.asset(airlineImg[item.airline]!)),
          const DottedLine(
              dashColor: const Color.fromARGB(255, 196, 195, 195),
              dashLength: 8,
              lineLength: 100,
              lineThickness: 1,
              direction: Axis.vertical),
          Expanded(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Departure"),
                          Text(
                            DateFormat('jmz')
                                .format(item.departure_time!.toDate()),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Expanded(child: Container()),
                          Text("Flight No."),
                          Text(
                            item.no!,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Arrive"),
                          Text(
                            DateFormat('jmz')
                                .format(item.arrive_time!.toDate()),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Expanded(child: Container()),
                          Text(
                            '\$' + item.price.toString(),
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ])

                //  GridView.count(
                //   primary: false,
                //   padding: const EdgeInsets.all(20),
                //   crossAxisSpacing: 10,
                //   mainAxisSpacing: 10,
                //   crossAxisCount: 2,
                //   children: <Widget>[
                //     Container(
                //       padding: const EdgeInsets.all(8),
                //       color: Colors.teal[100],
                //       child: const Text("He'd have you all unravel at the"),
                //     ),
                //     Container(
                //       padding: const EdgeInsets.all(8),
                //       color: Colors.teal[200],
                //       child: const Text('Heed not the rabble'),
                //     ),
                //     Container(
                //       padding: const EdgeInsets.all(8),
                //       color: Colors.teal[300],
                //       child: const Text('Sound of screams but the'),
                //     ),
                //   ],
                // )
                ),
          )
        ],
      ),
    );
  }
}
