import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_bloc.dart';
import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_event.dart';
import 'package:app_cyclone/blocs/log_in_bloc/log_in_bloc.dart';
import 'package:app_cyclone/travo_app_ac/models/room.dart';
import 'package:app_cyclone/widgets/check_out_steps_line.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutScreen extends StatefulWidget {
  CheckOutScreen({super.key, required this.screen, required this.step});

  Widget screen;
  int step;

  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Room get room => BlocProvider.of<BookingInfoBloc>(context).state.room;

  List<String> steps = [
    'Book and Review',
    'Payment',
    'Confirm',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<BookingInfoBloc>(context).add(UpdateBookingInfoEvent(
        userId: BlocProvider.of<LogInBloc>(context).state.currentUser!.token));
    BlocProvider.of<BookingInfoBloc>(context)
        .add(UpdateBookingInfoEvent(room: room.id));
    BlocProvider.of<BookingInfoBloc>(context)
        .add(UpdateBookingInfoEvent(hotel: room.hotel));
    BlocProvider.of<BookingInfoBloc>(context).add(UpdateBookingInfoEvent(
        email: BlocProvider.of<LogInBloc>(context).state.currentUser!.email));
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
