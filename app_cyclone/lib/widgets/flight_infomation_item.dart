import 'package:app_cyclone/travo_app_ac/models/flight.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class FlightInfomationItem extends StatelessWidget {
  const FlightInfomationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Column(
              children: [
                Text(
                  "JKT",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            const DottedLine(
              direction: Axis.horizontal,
              lineLength: 30,
              lineThickness: 1.0,
              dashLength: 30,
              dashColor: Colors.black,
              dashRadius: 0.0,
              dashGapLength: 4.0,
              dashGapColor: Colors.transparent,
              dashGapRadius: 0.0,
            ),
            const SizedBox(
              width: 10,
            ),
            Transform.rotate(
              angle: 3.14 / 2,
              child: const Icon(
                Icons.flight,
                size: 40,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const DottedLine(
              direction: Axis.horizontal,
              lineLength: 30,
              lineThickness: 1.0,
              dashLength: 30,
              dashColor: Colors.black,
              dashRadius: 0.0,
              dashGapLength: 4.0,
              dashGapColor: Colors.transparent,
              dashGapRadius: 0.0,
            ),
            const SizedBox(
              width: 10,
            ),
            const Column(
              children: [
                Text(
                  "VN",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 75,
          child: Row(
            children: [
              Image.asset(Flight.airlineImg["AirAsia"]!),
              const SizedBox(
                width: 20,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Airline"),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "AirAsia",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Expanded(child: Container()),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Passenger"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "James Christin",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Date"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "24 Mar 2020",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Boarding Time"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "02:39pm",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Gate"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "24A",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Seat"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "5A",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Flight No."),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "NNS24",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Class"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Economy",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        DottedLine(
          dashColor: const Color.fromARGB(117, 158, 158, 158),
          direction: Axis.horizontal,
          dashLength: 10,
          lineThickness: 2,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
