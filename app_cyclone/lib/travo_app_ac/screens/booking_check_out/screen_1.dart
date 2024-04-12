import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_bloc.dart';
import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_event.dart';
import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_state.dart';
import 'package:app_cyclone/travo_app_ac/models/guest.dart';
import 'package:app_cyclone/travo_app_ac/models/room.dart';
import 'package:app_cyclone/travo_app_ac/screens/contact_details_screen/contact_details_screen.dart';
import 'package:app_cyclone/widgets/ColorIcon.dart';
import 'package:app_cyclone/widgets/MyDatePicker.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/check_out_option.dart';
import 'package:app_cyclone/widgets/room_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Screen1BookingRoom extends StatefulWidget {
  const Screen1BookingRoom({super.key});

  @override
  _Screen1BookingRoomState createState() => _Screen1BookingRoomState();
}

class _Screen1BookingRoomState extends State<Screen1BookingRoom> {
  Room get room => BlocProvider.of<BookingInfoBloc>(context).state.room;

  final ValueNotifier<DateTime?> _startDateController =
      ValueNotifier<DateTime?>(null);
  final ValueNotifier<DateTime?> _endDateController =
      ValueNotifier<DateTime?>(null);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoomListItem(
          item: room,
        ),
        CheckOutOption(
            icon: ColorIcon(
                icon: Icons.people,
                color: const Color.fromRGBO(97, 85, 204, 1),
                bgColor: const Color.fromRGBO(224, 221, 245, 1)),
            title: AppLocalizations.of(context)!.contact_details,
            hasButton: true,
            subAdd: AppLocalizations.of(context)!.add_contact,
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
            onPressed: () async {
              final Guest guest = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ContactDetailsScreen()),
              );
              if (guest.email != "") {
                BlocProvider.of<BookingInfoBloc>(context)
                    .add(UpdateBookingInfoEvent(guest: [guest]));
              }
              Navigator.pushNamed(context, '/contact-details');
            }),
        CheckOutOption(
            icon: ColorIcon(
                icon: Icons.percent,
                color: const Color.fromRGBO(254, 156, 94, 1),
                bgColor: const Color.fromARGB(66, 254, 155, 94)),
            hasButton: true,
            title: AppLocalizations.of(context)!.promo_caode,
            subAdd: BlocProvider.of<BookingInfoBloc>(context)
                        .state
                        .currentBooking
                        .promo_code !=
                    ""
                ? ""
                : AppLocalizations.of(context)!.add_promo_caode,
            data: BlocProvider.of<BookingInfoBloc>(context)
                .state
                .currentBooking
                .promo_code,
            onPressed: () {
              Navigator.pushNamed(context, '/promo-code');
            }),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.booking_date,
                    style: const TextStyle(
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
                            bgColor: const Color.fromRGBO(237, 197, 197, 1)),
                        title: AppLocalizations.of(context)!.check_in,
                      ),
                    ),
                    Expanded(
                      child: MyDatePicker(
                        selectedDate: _endDateController,
                        icon: ColorIcon(
                          icon: Icons.time_to_leave,
                          color: const Color.fromRGBO(62, 200, 188, 1),
                          bgColor: const Color.fromRGBO(62, 200, 188, 0.477),
                        ),
                        title: AppLocalizations.of(context)!.check_out,
                      ),
                    )
                  ],
                ),
              ],
            )),
        BlocBuilder<BookingInfoBloc, BookingInfoState>(
            builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                    UpdateBookingInfoEvent(date_end: _endDateController.value));

                Navigator.pushNamed(context, '/check-out-2');
              },
              isFullWidth: true,
            ),
          );
        })
      ],
    );
  }
}
