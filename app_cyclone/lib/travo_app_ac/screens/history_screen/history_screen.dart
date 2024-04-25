import 'package:app_cyclone/blocs/log_in_bloc/log_in_bloc.dart';
import 'package:app_cyclone/travo_app_ac/models/booking.dart';
import 'package:app_cyclone/travo_app_ac/models/booking_flight.dart';
import 'package:app_cyclone/travo_app_ac/models/user_info.dart';
import 'package:app_cyclone/travo_app_ac/screens/history_screen/items/booking_flight_item.dart';
import 'package:app_cyclone/travo_app_ac/screens/history_screen/items/booking_room_item.dart';
import 'package:app_cyclone/travo_app_ac/service/history_service.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  ValueNotifier<List<Booking>> bookingRoom = ValueNotifier<List<Booking>>([]);
  ValueNotifier<List<BookingFlight>> bookingFlight =
      ValueNotifier<List<BookingFlight>>([]);

  UserInfo_ get user => BlocProvider.of<LogInBloc>(context).state.currentUser!;

  void fetchData() async {
    bookingRoom.value = await HistoryService.getBookingRoom(user.email);

    bookingFlight.value = await HistoryService.getBookingFlight(user.email);
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        body: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Column(
            children: [
              MyHeader(
                context: context,
                title: AppLocalizations.of(context)!.history,
                subTitle: AppLocalizations.of(context)!.your_jouney,
              ),
              TabBar(tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.room),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.flights),
                    ],
                  ),
                ),
              ]),
              Expanded(
                child: TabBarView(children: [
                  ValueListenableBuilder<List<Booking>>(
                      valueListenable: bookingRoom,
                      builder: (context, value, child) {
                        return ListView(
                            padding: const EdgeInsets.all(0),
                            children: bookingRoom.value
                                .map((e) => BookingRoomItem(booking: e))
                                .toList());
                      }),
                  ValueListenableBuilder<List<BookingFlight>>(
                      valueListenable: bookingFlight,
                      builder: (context, value, child) {
                        return ListView(
                            padding: const EdgeInsets.all(0),
                            children: bookingFlight.value
                                .map((e) => BookingFlightItem(booking: e))
                                .toList());
                      }),
                ]),
              )
            ],
          ),
        ));
  }
}
