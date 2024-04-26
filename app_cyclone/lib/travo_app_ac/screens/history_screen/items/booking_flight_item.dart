import 'package:app_cyclone/travo_app_ac/models/booking_flight.dart';
import 'package:app_cyclone/travo_app_ac/models/flight.dart';
import 'package:app_cyclone/travo_app_ac/service/flight_service.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingFlightItem extends StatefulWidget {
  BookingFlightItem({super.key, required this.booking});
  final BookingFlight booking;

  @override
  _BookingFlightItemState createState() => _BookingFlightItemState();
}

class _BookingFlightItemState extends State<BookingFlightItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  ValueNotifier<Flight?> flight = ValueNotifier<Flight?>(null);
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    flight.dispose();
  }

  void getData() async {
    flight.value = await FlightService.getFlightById(widget.booking.flight);
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).cardColor,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ValueListenableBuilder<Flight?>(
            valueListenable: flight,
            builder: (context, value, child) {
              return value == null
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                Flight.airlineImg[flight.value!.airline]!,
                                width: 130,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                // color: Colors.red,
                                padding: const EdgeInsets.only(
                                    top: 10, left: 15, bottom: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          flight.value!.from_place ?? "",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Transform.rotate(
                                          angle: 3.14 / 2,
                                          child: const Icon(
                                            Icons.flight,
                                            size: 20,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          flight.value!.to_place ?? "",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text("Airline: "),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          flight.value!.airline ?? "",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("Flight No.: "),
                                          Text(
                                            flight.value!.no ?? "",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ])
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const DottedLine(
                          dashColor: const Color.fromARGB(117, 158, 158, 158),
                          direction: Axis.horizontal,
                          dashLength: 10,
                          lineThickness: 2,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Date"),
                                Text(
                                  DateFormat('d MMM yyyy').format(
                                      flight.value!.departure_time!.toDate()),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text("Boarding Time"),
                                Text(
                                  DateFormat('jmz').format(
                                      flight.value!.departure_time!.toDate()),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Seat"),
                                Text(
                                  // flight.value!.seat![0]['name'],
                                  widget.booking.seat!.name,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Class"),
                                Text(
                                  widget.booking.seat!.type,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text("created at: ",
                                style: TextStyle(fontSize: 12)),
                            Text(
                              DateFormat('yyyy-MM-dd hh:mm:ss')
                                  .format(widget.booking.createdAt!)
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    );
            }));
  }
}
