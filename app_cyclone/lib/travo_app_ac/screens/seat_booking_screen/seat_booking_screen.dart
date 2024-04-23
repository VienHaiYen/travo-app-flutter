import 'package:app_cyclone/blocs/seat_bloc/seat_booking_bloc.dart';
import 'package:app_cyclone/blocs/seat_bloc/seat_booking_state.dart';
import 'package:app_cyclone/travo_app_ac/enums/seat_state.dart';
import 'package:app_cyclone/travo_app_ac/models/flight.dart';
import 'package:app_cyclone/travo_app_ac/models/guest.dart';
import 'package:app_cyclone/travo_app_ac/models/seat.dart';
import 'package:app_cyclone/travo_app_ac/screens/seat_booking_screen/seat_layout.dart';
import 'package:app_cyclone/widgets/ColorIcon.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:book_my_seat/book_my_seat.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SeatBookingScreen extends StatefulWidget {
  const SeatBookingScreen({super.key, required this.flight});

  final Flight flight;

  @override
  _SeatBookingScreenState createState() => _SeatBookingScreenState();
}

class _SeatBookingScreenState extends State<SeatBookingScreen> {
  List<List<SeatState2>> convertMapToList(Map<String, dynamic> map) {
    List<List<SeatState2>> result = [];

    map.values.forEach((seatList) {
      if (seatList is List<dynamic>) {
        List<SeatState2> convertedList = seatList
            .map((isBooked) =>
                isBooked == true ? SeatState2.sold : SeatState2.available)
            .toList();
        result.add(convertedList);
      }
    });

    return result;
  }

  @override
  Widget build(BuildContext context) {
    const colName = ["A", "B", "C", "D", "E", "F"];
    List<List<SeatState2>> business = convertMapToList(widget.flight.seat![0]);
    List<List<SeatState2>> economy = convertMapToList(widget.flight.seat![1]);

    List<List<SeatState2>> all = business + economy;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        body: Column(children: [
          MyHeader(
            context: context,
            title: 'Select Seat',
          ),
          BlocProvider<SeatBookingBloc>(
            create: (context) => SeatBookingBloc(),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  height: 500,
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Column(
                        children: [
                          Container(
                            width: 150,
                            height: 200,
                            margin: const EdgeInsets.all(20),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(child:
                                BlocBuilder<SeatBookingBloc, SeatBookingState>(
                                    builder: (context, state) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ColorIcon(
                                          icon: Icons.flight_class_rounded,
                                          color: const Color.fromRGBO(
                                              62, 200, 188, 1),
                                          bgColor: const Color.fromRGBO(
                                              62, 200, 188, 0.329)),
                                      Text(
                                        state.colInd == -1
                                            ? "Select"
                                            : '${state.rowInd + 1}${colName[state.colInd]}',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  state.colInd == -1
                                      ? Container()
                                      : Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: state.rowInd <= business.length
                                              ? const Text(
                                                  "Buiness",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                )
                                              : const Text("Economy",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16)),
                                        ),
                                  // Text("Economy"),
                                  Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              224, 221, 245, 1),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        '\$${widget.flight.price.toString()}',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              );
                            })),
                          ),
                        ],
                      ),
                      Container(
                        width: 250,
                        child: Stack(children: [
                          Positioned.fill(
                            child: SvgPicture.asset(
                              'assets/svg/ship.svg',
                              alignment: Alignment.topCenter,
                              width: 200,
                              // height: MediaQuery.of(context).size.height,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Positioned(
                            top: 40,
                            left: 75,
                            child: SvgPicture.asset(
                              'assets/svg/ship-door.svg',
                              alignment: Alignment.topCenter,
                              width: 100,
                              // height: MediaQuery.of(context).size.height,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Positioned(
                            // top: 100,
                            top: 100,
                            child: SizedBox(
                              width: 250,
                              height: 400,
                              child: SeatLayout(seats: all),
                            ),
                          )
                        ]),
                      )
                    ],
                  ),
                ),
                BlocBuilder<SeatBookingBloc, SeatBookingState>(
                    builder: (context, state) {
                  return Button(
                      text: "Processed",
                      isFullWidth: true,
                      onPressed: () {
                        if (state.colInd == -1) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Please Select"),
                            duration: Durations.short4,
                          ));

                          return;
                        }
                        Navigator.pop(
                          context,
                          Seat(
                              name:
                                  '${state.rowInd + 1}${colName[state.colInd]}',
                              type: state.rowInd <= business.length
                                  ? "Business"
                                  : "Economy"),
                        );
                      });
                })
              ],
            ),
          ),
        ]));
  }
}
