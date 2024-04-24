import 'dart:math' as math;
import 'package:app_cyclone/travo_app_ac/models/search_flight.dart';
import 'package:app_cyclone/widgets/ColorIcon.dart';
import 'package:app_cyclone/widgets/MyDatePicker.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/common_icon_textfield.dart';
import 'package:app_cyclone/widgets/custom_dropdown_button.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FlightScreen extends StatefulWidget {
  const FlightScreen({Key? key}) : super(key: key);

  @override
  _FlightScreenState createState() => _FlightScreenState();
}

class _FlightScreenState extends State<FlightScreen> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();

  final TextEditingController _numberPassengerController =
      TextEditingController(text: "1 Passenger");

  final ValueNotifier<DateTime?> _departureDateController =
      ValueNotifier<DateTime?>(DateTime(2023, 10, 22, 0, 0, 0));
  final ValueNotifier<DateTime?> _returnDateController =
      ValueNotifier<DateTime?>(null);

  final ValueNotifier<DateTime?> _departureDateController2 =
      ValueNotifier<DateTime?>(null);
  final ValueNotifier<String> _classController = ValueNotifier<String>("");

  ValueNotifier<int> typeFlightBooking = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    _fromController.text = "USA";
    _toController.text = "Australia";

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        body: Column(children: [
          MyHeader(
            context: context,
            title: AppLocalizations.of(context)!.book_your_flight,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  const SizedBox(
                    height: 20,
                  ),
                  ValueListenableBuilder(
                    valueListenable: typeFlightBooking,
                    builder: (context, value, child) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button(
                          text: AppLocalizations.of(context)!.one_way,
                          onPressed: () {
                            typeFlightBooking.value = 0;
                          },
                          textColor: typeFlightBooking.value == 0
                              ? Colors.black
                              : null,
                          color: typeFlightBooking.value == 0
                              ? const Color.fromRGBO(224, 221, 245, 1)
                              : const Color.fromRGBO(254, 156, 94, 1),
                        ),
                        Button(
                          text: AppLocalizations.of(context)!.round_way,
                          onPressed: () {
                            typeFlightBooking.value = 1;
                          },
                          textColor: typeFlightBooking.value == 1
                              ? Colors.black
                              : null,
                          color: typeFlightBooking.value == 1
                              ? const Color.fromRGBO(224, 221, 245, 1)
                              : const Color.fromRGBO(254, 156, 94, 1),
                        ),
                        Button(
                          text: AppLocalizations.of(context)!.muti_city,
                          onPressed: () {
                            typeFlightBooking.value = 2;
                          },
                          textColor: typeFlightBooking.value == 2
                              ? Colors.black
                              : null,
                          color: typeFlightBooking.value == 2
                              ? const Color.fromRGBO(224, 221, 245, 1)
                              : const Color.fromRGBO(254, 156, 94, 1),
                        ),
                      ],
                    ),
                  ),
                  ValueListenableBuilder(
                      valueListenable: typeFlightBooking,
                      builder: (context, value, child) => value == 2
                          ? const Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Flight 1"),
                              ],
                            )
                          : Container()),
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      Column(
                        children: [
                          CommonIconTextfield(
                              icon: Column(
                                children: [
                                  Transform.rotate(
                                    angle: math.pi,
                                    child: const Icon(
                                      Icons.flight,
                                      color: Color.fromRGBO(97, 85, 204, 1),
                                      size: 30,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.more_vert,
                                    color: Color.fromRGBO(97, 85, 204, 1),
                                    size: 20,
                                  ),
                                ],
                              ),
                              controller: _fromController,
                              label: AppLocalizations.of(context)!.from),
                          CommonIconTextfield(
                              icon: const Column(
                                children: [
                                  Icon(
                                    Icons.more_vert,
                                    color: Color.fromRGBO(97, 85, 204, 1),
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.location_on,
                                    color: Color.fromRGBO(254, 156, 94, 1),
                                    size: 30,
                                  ),
                                ],
                              ),
                              controller: _toController,
                              label: AppLocalizations.of(context)!.to),
                        ],
                      ),
                      Positioned(
                          right: 10,
                          top: MediaQuery.of(context).size.height * 0.05,
                          child: CircleAvatar(
                            radius: 25,
                            child: IconButton(
                              color: const Color.fromRGBO(224, 221, 245, 1),
                              icon: const Icon(
                                color: Colors.black,
                                Icons.swap_vert,
                                size: 25,
                              ),
                              onPressed: () {
                                String temp = _fromController.text;
                                _fromController.text = _toController.text;
                                _toController.text = temp;
                              },
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          ColorIcon(
                              icon: Icons.calendar_month,
                              color: const Color.fromRGBO(254, 156, 94, 1),
                              bgColor:
                                  const Color.fromRGBO(254, 155, 94, 0.315)),
                          MyDatePicker(
                              title: AppLocalizations.of(context)!.departure,
                              selectedDate: _departureDateController)
                        ],
                      )),
                  ValueListenableBuilder(
                    valueListenable: typeFlightBooking,
                    builder: (context, value, child) => value == 1
                        ? Column(
                            children: [
                              const SizedBox(height: 10),
                              Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    children: [
                                      ColorIcon(
                                          icon: Icons.calendar_month,
                                          color: const Color.fromRGBO(
                                              254, 156, 94, 1),
                                          bgColor: const Color.fromRGBO(
                                              254, 155, 94, 0.315)),
                                      MyDatePicker(
                                          title: AppLocalizations.of(context)!
                                              .departure,
                                          selectedDate: _returnDateController)
                                    ],
                                  )),
                            ],
                          )
                        : Container(),
                  ),
                  const SizedBox(height: 10),
                  CommonIconTextfield(
                      icon: ColorIcon(
                          icon: Icons.person,
                          color: const Color.fromRGBO(247, 119, 119, 1),
                          bgColor: const Color.fromRGBO(247, 119, 119, 0.4)),
                      controller: _numberPassengerController,
                      changeable: false,
                      label: AppLocalizations.of(context)!.passenger),
                  const SizedBox(height: 10),
                  Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          ColorIcon(
                              icon: Icons.flight_class,
                              color: const Color.fromRGBO(62, 200, 188, 1),
                              bgColor: const Color.fromARGB(88, 62, 200, 188)),
                          Expanded(
                            child: CustomDropdownButton(
                              items: [
                                AppLocalizations.of(context)!.economy,
                                AppLocalizations.of(context)!.business,
                              ],
                              label: "Class",
                              selectItem: _classController,
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(height: 20),
                  ValueListenableBuilder(
                      valueListenable: typeFlightBooking,
                      builder: (context, value, child) => value == 2
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  const Text("Flight 2"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CommonIconTextfield(
                                      icon: Column(
                                        children: [
                                          Transform.rotate(
                                            angle: math.pi,
                                            child: const Icon(
                                              Icons.flight,
                                              color: Color.fromRGBO(
                                                  97, 85, 204, 1),
                                              size: 30,
                                            ),
                                          ),
                                          const Icon(
                                            Icons.more_vert,
                                            color:
                                                Color.fromRGBO(97, 85, 204, 1),
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                      controller: _fromController,
                                      label: "From"),
                                  CommonIconTextfield(
                                      icon: const Column(
                                        children: [
                                          Icon(
                                            Icons.more_vert,
                                            color:
                                                Color.fromRGBO(97, 85, 204, 1),
                                            size: 20,
                                          ),
                                          Icon(
                                            Icons.location_on,
                                            color:
                                                Color.fromRGBO(254, 156, 94, 1),
                                            size: 30,
                                          ),
                                        ],
                                      ),
                                      controller: _toController,
                                      label: "To"),
                                  const SizedBox(height: 10),
                                  Container(
                                      color: Colors.white,
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          ColorIcon(
                                              icon: Icons.calendar_month,
                                              color: const Color.fromRGBO(
                                                  254, 156, 94, 1),
                                              bgColor: const Color.fromRGBO(
                                                  254, 155, 94, 0.315)),
                                          MyDatePicker(
                                              title: "Departure",
                                              selectedDate:
                                                  _departureDateController2)
                                        ],
                                      )),
                                  // ValueListenableBuilder(
                                  //   valueListenable: typeFlightBooking,
                                  //   builder: (context, value, child) => value ==
                                  //           1
                                  //       ? Column(
                                  //           children: [
                                  //             const SizedBox(height: 10),
                                  //             Container(
                                  //                 color: Colors.white,
                                  //                 padding:
                                  //                     const EdgeInsets.all(20),
                                  //                 child: Row(
                                  //                   children: [
                                  //                     ColorIcon(
                                  //                         icon: Icons
                                  //                             .calendar_month,
                                  //                         color: const Color
                                  //                             .fromRGBO(
                                  //                             254, 156, 94, 1),
                                  //                         bgColor: const Color
                                  //                             .fromRGBO(254,
                                  //                             155, 94, 0.315)),
                                  //                     MyDatePicker(
                                  //                         title: "Departure",
                                  //                         selectedDate:
                                  //                             _departureDateController3)
                                  //                   ],
                                  //                 )),
                                  //           ],
                                  //         )
                                  //       : Container(),
                                  // ),
                                  const SizedBox(height: 10),
                                  CommonIconTextfield(
                                      icon: const Icon(
                                        Icons.more_vert,
                                        color: Color.fromRGBO(97, 85, 204, 1),
                                        size: 20,
                                      ),
                                      controller: _numberPassengerController,
                                      changeable: false,
                                      label: "Passengers"),
                                  const SizedBox(height: 10),
                                  Container(
                                      color: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        children: [
                                          ColorIcon(
                                              icon: Icons.flight_class,
                                              color: const Color.fromRGBO(
                                                  62, 200, 188, 1),
                                              bgColor: const Color.fromARGB(
                                                  88, 62, 200, 188)),
                                          Expanded(
                                            child: CustomDropdownButton(
                                              items: const [
                                                "Economy",
                                                "Business",
                                                "First Class"
                                              ],
                                              label: "Class",
                                              selectItem: _classController,
                                            ),
                                          ),
                                        ],
                                      )),
                                ])
                          : Container()),
                  const SizedBox(height: 20),
                  Button(
                      text: "Search",
                      isFullWidth: true,
                      onPressed: () async {
                        if (_fromController.text.isEmpty ||
                            _toController.text.isEmpty ||
                            _departureDateController.value == null ||
                            _classController.value.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please fill all the fields"),
                            ),
                          );
                          return;
                        }
                        print(_departureDateController.value);

                        SearchFlight searchFlight = SearchFlight(
                            from: _fromController.text,
                            to: _toController.text,
                            date: _departureDateController.value!);
                        Navigator.of(context)
                            .pushNamed("/ticket", arguments: searchFlight);
                      }),
                  const SizedBox(height: 20),
                ])),
          ))
        ]));
  }
}
