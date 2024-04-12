import 'package:app_cyclone/blocs/booking_flight_info_bloc/booking_flight_info_bloc.dart';
import 'package:app_cyclone/blocs/booking_flight_info_bloc/booking_flight_info_event.dart';
import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_bloc.dart';
import 'package:app_cyclone/travo_app_ac/models/flight.dart';
import 'package:app_cyclone/travo_app_ac/models/room.dart';
import 'package:app_cyclone/travo_app_ac/service/booking_flight_service.dart';
import 'package:app_cyclone/travo_app_ac/service/booking_service.dart';
import 'package:app_cyclone/widgets/ColorIcon.dart';
import 'package:app_cyclone/widgets/MyDateDisplay.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/flight_infomation_item.dart';
import 'package:app_cyclone/widgets/master_card.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Screen3BookingFlight extends StatefulWidget {
  const Screen3BookingFlight({super.key});

  @override
  _Screen3BookingFlightState createState() => _Screen3BookingFlightState();
}

class _Screen3BookingFlightState extends State<Screen3BookingFlight> {
  Flight get flight =>
      BlocProvider.of<BookingFlightInfoBloc>(context).state.flight;
  @override
  Widget build(BuildContext context) {
    print(BlocProvider.of<BookingFlightInfoBloc>(context)
        .state
        .currentBooking
        .toMap());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(children: [
        Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: flightInfo()),
        _buildBill(flight.price!),
        MasterCard(),
        Button(
            isFullWidth: true,
            text: "Pay now",
            onPressed: () {
              BlocProvider.of<BookingFlightInfoBloc>(context)
                  .add(UpdateBookingFlightInfoEvent(createdAt: DateTime.now()));
              Map<String, dynamic> data =
                  BlocProvider.of<BookingFlightInfoBloc>(context)
                      .state
                      .currentBooking
                      .toMap();
              print(data);

              BookingFlightService.addDataToFirestore(data);
            })
      ]),
    );
  }

  Widget flightInfo() {
    return Column(children: [
      FlightInfomationItem(
        flight: flight,
      ),
      QRDisplay()
    ]);
  }

  Widget QRDisplay() {
    return Column(
      children: [
        Container(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/qr-1.png"),
              Image.asset("assets/images/qr-2.png"),
              Image.asset("assets/images/qr-3.png"),
            ],
          ),
        ),
        const Text("1234 5678 90AS 6543 21CV")
      ],
    );
  }

  Widget _buildBill(int price) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("1 Passenger"),
            Text('\$ $price'),
          ]),
          const SizedBox(
            height: 10,
          ),
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Insurance"),
                Text('-'),
              ]),
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text(
              "Total",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$ $price',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ])
        ],
      ),
    );
  }

  Widget _roomItem({required Room item}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name ?? "no name",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${item.typePrice}',
                          maxLines: 2,
                        ),
                        // Text(
                        //   'Room Size: ${item.maxGuest} guests',
                        //   maxLines: 2,
                        // ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(item.image ?? "")),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MyDateDisplay(
                  selectedDate: BlocProvider.of<BookingInfoBloc>(context)
                              .state
                              .currentBooking
                              .date_start !=
                          null
                      ? DateFormat('yyyy-MM-dd').format(
                          BlocProvider.of<BookingInfoBloc>(context)
                              .state
                              .currentBooking
                              .date_start!)
                      : "",
                  icon: ColorIcon(
                      icon: Icons.time_to_leave,
                      color: const Color.fromRGBO(247, 119, 119, 1),
                      bgColor: const Color.fromRGBO(237, 197, 197, 1)),
                  title: "Check-in",
                ),
              ),
              Expanded(
                child: MyDateDisplay(
                  selectedDate: BlocProvider.of<BookingInfoBloc>(context)
                              .state
                              .currentBooking
                              .date_end !=
                          null
                      ? DateFormat('yyyy-MM-dd').format(
                          BlocProvider.of<BookingInfoBloc>(context)
                              .state
                              .currentBooking
                              .date_end!)
                      : "",
                  icon: ColorIcon(
                    icon: Icons.time_to_leave,
                    color: const Color.fromRGBO(62, 200, 188, 1),
                    bgColor: const Color.fromRGBO(62, 200, 188, 0.477),
                  ),
                  title: "Check-out",
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
