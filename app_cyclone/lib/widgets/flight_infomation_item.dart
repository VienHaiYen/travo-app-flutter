import 'package:app_cyclone/travo_app_ac/models/flight.dart';
import 'package:app_cyclone/travo_app_ac/models/seat.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FlightInfomationItem extends StatelessWidget {
  const FlightInfomationItem({super.key, required this.flight, this.seat});

  final Flight flight;
  final Seat? seat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  flight.from_place ?? "",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
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
            Column(
              children: [
                Text(
                  flight.to_place ?? "",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
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
              Image.asset(
                Flight.airlineImg[flight.airline]!,
                width: 100,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Airline"),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    flight.airline ?? "",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Date"),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  DateFormat('d MMM yyyy')
                      .format(flight.departure_time!.toDate()),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Boarding Time"),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  DateFormat('jmz').format(flight.departure_time!.toDate()),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Gate"),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Undefined",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Seat"),
                const SizedBox(
                  height: 10,
                ),
                // fix sau
                Text(
                  seat?.name ?? "No input",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Flight No."),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  flight.no ?? "",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Class"),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  seat?.type ?? "No input",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
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
