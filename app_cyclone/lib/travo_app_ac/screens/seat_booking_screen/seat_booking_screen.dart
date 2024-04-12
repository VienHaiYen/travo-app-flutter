import 'package:app_cyclone/blocs/booking_flight_info_bloc/booking_flight_info_bloc.dart';
import 'package:app_cyclone/blocs/booking_flight_info_bloc/booking_flight_info_event.dart';
import 'package:app_cyclone/travo_app_ac/models/flight.dart';
import 'package:app_cyclone/travo_app_ac/models/guest.dart';
import 'package:app_cyclone/travo_app_ac/models/seat.dart';
import 'package:app_cyclone/widgets/ColorIcon.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:book_my_seat/book_my_seat.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';

class SeatBookingScreen extends StatefulWidget {
  const SeatBookingScreen({super.key});

  @override
  _SeatBookingScreenState createState() => _SeatBookingScreenState();
}

class _SeatBookingScreenState extends State<SeatBookingScreen> {
  Flight get flight =>
      BlocProvider.of<BookingFlightInfoBloc>(context).state.flight;
  List<List<SeatState>> convertMapToList(Map<String, dynamic> map) {
    List<List<SeatState>> result = [];

    map.values.forEach((seatList) {
      if (seatList is List<dynamic>) {
        List<SeatState> convertedList = seatList
            .map((isBooked) =>
                isBooked == true ? SeatState.sold : SeatState.unselected)
            .toList();
        result.add(convertedList);
      }
    });

    return result;
  }

  @override
  Widget build(BuildContext context) {
    const colName = [
      "A",
      "B",
      "C",
      "D",
    ];
    List<List<SeatState>> business = convertMapToList(flight.seat![0]);
    List<List<SeatState>> economy = convertMapToList(flight.seat![1]);
    ValueNotifier<String> selectedSeat = ValueNotifier("");
    print(business.length);

    List<List<SeatState>> all = business + economy;
    print(all.length);
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        body: SingleChildScrollView(
            child: Column(children: [
          MyHeader(
            context: context,
            title: 'Select Seat',
          ),
          Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      margin: const EdgeInsets.only(right: 20),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: ValueListenableBuilder(
                              valueListenable: selectedSeat,
                              builder: (context, value, child) => Column(
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
                                            value == "" ? "Select" : value,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      value == ""
                                          ? Container()
                                          : Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: int.parse(value[0]) <=
                                                      business.length
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
                                            '\$${flight.price.toString()}',
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ))
                                    ],
                                  ))),
                    ),
                    SeatLayoutWidget(
                      onSeatStateChanged:
                          (rowIndex, colIndex, updatedSeatState) {
                        if (updatedSeatState == SeatState.selected) {
                          selectedSeat.value =
                              "${rowIndex + 1}${colName[colIndex]} ";
                          return;
                        }
                      },
                      stateModel: SeatLayoutStateModel(
                          rows: all.length,
                          cols: all[0].length,
                          seatSvgSize: 45,
                          pathUnSelectedSeat:
                              'assets/svg/svg_unselected_seat.svg',
                          pathSelectedSeat: 'assets/svg/svg_selected_seat.svg',
                          pathSoldSeat: 'assets/svg/svg_sold_seat.svg',
                          pathDisabledSeat: 'assets/svg/svg_disabled_seat.svg',
                          currentSeatsState: all),
                    )
                  ],
                ),
                Button(
                    text: "Processed",
                    isFullWidth: true,
                    onPressed: () {
                      if (selectedSeat.value == "") return;
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Seat selected")));

                      Navigator.pop(
                        context,
                        Seat(
                            name: selectedSeat.value,
                            type: int.parse(selectedSeat.value[0]) <=
                                    business.length
                                ? "Business"
                                : "Economy"),
                      );
                    })
              ]))
        ])));
  }
}
