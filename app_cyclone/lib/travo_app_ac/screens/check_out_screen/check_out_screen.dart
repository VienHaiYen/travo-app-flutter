import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_bloc.dart';
import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_event.dart';
import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_state.dart';
import 'package:app_cyclone/blocs/log_in_bloc/log_in_bloc.dart';
import 'package:app_cyclone/travo_app_ac/models/room.dart';
import 'package:app_cyclone/widgets/ColorIcon.dart';
import 'package:app_cyclone/widgets/MyDatePicker.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/check_out_option.dart';
import 'package:app_cyclone/widgets/check_out_steps_line.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:app_cyclone/widgets/room_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

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

  final ValueNotifier<DateTime?> _startDateController =
      ValueNotifier<DateTime?>(null);
  final ValueNotifier<DateTime?> _endDateController =
      ValueNotifier<DateTime?>(null);
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
                stepNum: 1,
              ),
            ),
            RoomListItem(
              item: room,
            ),
            CheckOutOption(
                icon: ColorIcon(
                    icon: Icons.people,
                    color: const Color.fromRGBO(97, 85, 204, 1),
                    bgColor: const Color.fromRGBO(224, 221, 245, 1)),
                title: "Contact Details",
                hasButton: true,
                subAdd: "Add Contact",
                data: BlocProvider.of<BookingInfoBloc>(context)
                        .state
                        .currentBooking
                        .guest!
                        .isNotEmpty
                    ? BlocProvider.of<BookingInfoBloc>(context)
                        .state
                        .currentBooking
                        .guest![0]
                        .toString()
                    : "",
                onPressed: () {
                  Navigator.pushNamed(context, '/contact-details');
                }),
            CheckOutOption(
                icon: ColorIcon(
                    icon: Icons.percent,
                    color: const Color.fromRGBO(254, 156, 94, 1),
                    bgColor: const Color.fromARGB(66, 254, 155, 94)),
                hasButton: true,
                title: "Promo code",
                subAdd: BlocProvider.of<BookingInfoBloc>(context)
                            .state
                            .currentBooking
                            .promo_code !=
                        ""
                    ? ""
                    : "Add Promo Code",
                data: BlocProvider.of<BookingInfoBloc>(context)
                    .state
                    .currentBooking
                    .promo_code,
                onPressed: () {
                  Navigator.pushNamed(context, '/promo-code');
                }),
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Booking Date",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: MyDatePicker(
                            selectedDate: _startDateController,
                            icon: ColorIcon(
                                icon: Icons.time_to_leave,
                                color: const Color.fromRGBO(247, 119, 119, 1),
                                bgColor:
                                    const Color.fromRGBO(237, 197, 197, 1)),
                            title: "Check-in",
                          ),
                        ),
                        Expanded(
                          child: MyDatePicker(
                            selectedDate: _endDateController,
                            icon: ColorIcon(
                              icon: Icons.time_to_leave,
                              color: const Color.fromRGBO(62, 200, 188, 1),
                              bgColor:
                                  const Color.fromRGBO(62, 200, 188, 0.477),
                            ),
                            title: "Check-out",
                          ),
                        )
                      ],
                    ),
                  ],
                )),
            BlocBuilder<BookingInfoBloc, BookingInfoState>(
                builder: (context, state) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Button(
                  text: "Payment",
                  onPressed: () {
                    if (state.currentBooking.guest == []) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Fill Guest data')),
                      );
                      return;
                    }

                    if (_startDateController.value == null ||
                        _endDateController.value == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Fill data Check-in, Check-out day')),
                      );
                      return;
                    }

                    BlocProvider.of<BookingInfoBloc>(context).add(
                        UpdateBookingInfoEvent(
                            date_start: _startDateController.value));
                    BlocProvider.of<BookingInfoBloc>(context).add(
                        UpdateBookingInfoEvent(
                            date_end: _endDateController.value));

                    Navigator.pushNamed(context, '/check-out-2');
                  },
                  isFullWidth: true,
                ),
              );
            })
          ]),
        ));
  }
}
