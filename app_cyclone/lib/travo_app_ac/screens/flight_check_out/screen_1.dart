import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_bloc.dart';
import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_event.dart';
import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_state.dart';
import 'package:app_cyclone/routes/route_name.dart';
import 'package:app_cyclone/travo_app_ac/models/flight.dart';
import 'package:app_cyclone/travo_app_ac/models/room.dart';
import 'package:app_cyclone/widgets/ColorIcon.dart';
import 'package:app_cyclone/widgets/MyDatePicker.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/check_out_option.dart';
import 'package:app_cyclone/widgets/flight_infomation_item.dart';
import 'package:app_cyclone/widgets/room_list_item.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Screen1BookingFlight extends StatefulWidget {
  const Screen1BookingFlight({super.key});

  @override
  _Screen1BookingFlightState createState() => _Screen1BookingFlightState();
}

class _Screen1BookingFlightState extends State<Screen1BookingFlight> {
  Room get room => BlocProvider.of<BookingInfoBloc>(context).state.room;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                flightInfo(),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          CheckOutOption(
              icon: ColorIcon(
                  icon: Icons.people,
                  color: const Color.fromRGBO(97, 85, 204, 1),
                  bgColor: const Color.fromRGBO(224, 221, 245, 1)),
              title: "Contact Details",
              hasButton: true,
              subAdd: "Add Contact",
              data: "",
              onPressed: () {
                Navigator.pushNamed(context, '/contact-details');
              }),
          CheckOutOption(
              icon: ColorIcon(
                  icon: Icons.people,
                  color: const Color.fromRGBO(97, 85, 204, 1),
                  bgColor: const Color.fromRGBO(224, 221, 245, 1)),
              title: "Passengers & Seats",
              hasButton: true,
              subAdd: "Add Passenger",
              data: "",
              onPressed: () {
                Navigator.pushNamed(context, '/add-passenger');
              }),
          CheckOutOption(
              icon: ColorIcon(
                  icon: Icons.percent,
                  color: const Color.fromRGBO(254, 156, 94, 1),
                  bgColor: const Color.fromARGB(66, 254, 155, 94)),
              hasButton: true,
              title: "Promo code",
              subAdd: "Add Promo Code",
              data: BlocProvider.of<BookingInfoBloc>(context)
                  .state
                  .currentBooking
                  .promo_code,
              onPressed: () {
                Navigator.pushNamed(context, '/promo-code');
              }),
          Button(
              text: "Payment",
              isFullWidth: true,
              onPressed: () {
                Navigator.pushNamed(context, RouteName.flightCheckout2);
              })
        ],
      ),
    );
  }

  Widget PriceDisplay() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            text: '\$ 215 ',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30),
            children: const <TextSpan>[
              TextSpan(
                  text: '/passenger',
                  style: TextStyle(color: Colors.black, fontSize: 15)),
            ],
          ),
        ),
        Text("1 passenger")
      ],
    );
  }

  Widget flightInfo() {
    return Column(children: [FlightInfomationItem(), PriceDisplay()]);
  }
}
