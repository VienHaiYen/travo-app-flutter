import 'package:app_cyclone/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:app_cyclone/blocs/favorite_bloc/favorite_state.dart';
import 'package:app_cyclone/blocs/log_in_bloc/log_in_bloc.dart';
import 'package:app_cyclone/travo_app_ac/models/booking.dart';
import 'package:app_cyclone/travo_app_ac/models/booking_flight.dart';
import 'package:app_cyclone/travo_app_ac/models/user_info.dart';
import 'package:app_cyclone/travo_app_ac/screens/history_screen/items/booking_flight_item.dart';
import 'package:app_cyclone/travo_app_ac/screens/history_screen/items/booking_room_item.dart';
import 'package:app_cyclone/travo_app_ac/service/history_service.dart';
import 'package:app_cyclone/widgets/hotel_list_item.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:app_cyclone/widgets/place_list_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                title: "History",
                subTitle: "Your jouney!!",
              ),
              const TabBar(tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Rooms"),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Flights"),
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
                            children: bookingRoom.value
                                .map((e) => BookingRoomItem(booking: e))
                                .toList());
                      }),
                  ValueListenableBuilder<List<BookingFlight>>(
                      valueListenable: bookingFlight,
                      builder: (context, value, child) {
                        return ListView(
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
