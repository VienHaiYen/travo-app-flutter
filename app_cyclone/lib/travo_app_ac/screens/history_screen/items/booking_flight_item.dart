import 'package:app_cyclone/travo_app_ac/models/booking.dart';
import 'package:app_cyclone/travo_app_ac/models/booking_flight.dart';
import 'package:app_cyclone/travo_app_ac/models/flight.dart';
import 'package:app_cyclone/travo_app_ac/models/hotel.dart';
import 'package:app_cyclone/travo_app_ac/models/room.dart';
import 'package:app_cyclone/travo_app_ac/service/flight_service.dart';
import 'package:app_cyclone/travo_app_ac/service/hotel_service.dart';
import 'package:app_cyclone/travo_app_ac/service/room_service.dart';
import 'package:app_cyclone/widgets/flight_infomation_item.dart';
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

  void getData() async {
    // print(widget.booking.room);
    flight.value = await FlightService.getFlightById(widget.booking.flight);
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Colors.white,
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
                            Image.asset(
                              Flight.airlineImg[flight.value!.airline]!,
                              width: 150,
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.red,
                                padding: const EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                        const Text("Airline"),
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
                                          Text("Flight No."),
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
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 75,
                          child: Row(
                            children: [
                              Expanded(child: Container()),
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
                                  DateFormat('d MMM yyyy').format(
                                      flight.value!.departure_time!.toDate()),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Boarding Time"),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  DateFormat('jmz').format(
                                      flight.value!.departure_time!.toDate()),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Seat"),
                                const SizedBox(
                                  height: 10,
                                ),
                                // fix sau
                                const Text(
                                  "5A",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Class"),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Economy",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
            }));
  }
}
