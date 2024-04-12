import 'package:app_cyclone/blocs/booking_flight_info_bloc/booking_flight_info_bloc.dart';
import 'package:app_cyclone/blocs/booking_flight_info_bloc/booking_flight_info_event.dart';
import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_bloc.dart';
import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_event.dart';
import 'package:app_cyclone/blocs/log_in_bloc/log_in_bloc.dart';
import 'package:app_cyclone/travo_app_ac/models/flight.dart';
import 'package:app_cyclone/travo_app_ac/models/room.dart';
import 'package:app_cyclone/widgets/check_out_steps_line.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlightCheckOutScreen extends StatefulWidget {
  FlightCheckOutScreen({super.key, required this.screen, required this.step});

  Widget screen;
  int step;

  @override
  _FlightCheckOutScreenState createState() => _FlightCheckOutScreenState();
}

class _FlightCheckOutScreenState extends State<FlightCheckOutScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Flight get flight =>
      BlocProvider.of<BookingFlightInfoBloc>(context).state.flight;

  List<String> steps = [
    'Book and Review',
    'Payment',
    'Confirm',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<BookingFlightInfoBloc>(context).add(
        UpdateBookingFlightInfoEvent(
            email:
                BlocProvider.of<LogInBloc>(context).state.currentUser!.email));
    BlocProvider.of<BookingFlightInfoBloc>(context)
        .add(UpdateBookingFlightInfoEvent(flight: flight.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        body: SingleChildScrollView(
          child: Column(children: [
            MyHeader(
              context: context,
              title: 'Checkout',
              stepLine: CheckOutStepsLine(
                steps: steps,
                stepNum: widget.step,
              ),
            ),
            widget.screen
          ]),
        ));
  }
}
