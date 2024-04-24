import 'package:app_cyclone/travo_app_ac/models/booking.dart';
import 'package:app_cyclone/travo_app_ac/models/hotel.dart';
import 'package:app_cyclone/travo_app_ac/models/room.dart';
import 'package:app_cyclone/travo_app_ac/service/hotel_service.dart';
import 'package:app_cyclone/travo_app_ac/service/room_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingRoomItem extends StatefulWidget {
  BookingRoomItem({super.key, required this.booking});
  final Booking booking;

  String hotel = "1DoVZ9gg39ssDstmw4co";
  String room = "KINBj10yJvqRQNPbWHSg";
  String typePayment = "Bank transfer";

  @override
  _BookingRoomItemState createState() => _BookingRoomItemState();
}

class _BookingRoomItemState extends State<BookingRoomItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  ValueNotifier<Room?> room = ValueNotifier<Room?>(null);
  ValueNotifier<Hotel?> hotel = ValueNotifier<Hotel?>(null);

  void getData() async {
    // print(widget.booking.room);
    room.value = await RoomService.getRoomById(widget.booking.room);
    hotel.value = await HotelService.getHotelById(widget.booking.hotel);
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ValueListenableBuilder<Hotel?>(
          valueListenable: hotel,
          builder: (context, value, child) {
            return value == null
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(value.name ?? "",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                                ValueListenableBuilder<Room?>(
                                    valueListenable: room,
                                    builder: (context, value, child) {
                                      return room.value == null
                                          ? Container()
                                          : Row(
                                              children: [
                                                Text(
                                                    'Room: ${room.value!.name ?? ""}'),
                                              ],
                                            );
                                    }),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Colors.red,
                                      size: 16,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      value!.location ?? "",
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    // Text(value!.awayKilometer ?? " ")
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 16,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      value.rating.toString(),
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    Text(
                                      ' (${value.totalReview ?? "no "} ${AppLocalizations.of(context)!.reviews})',
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("Check-in: ",
                                        style: TextStyle(fontSize: 12)),
                                    Text(
                                      DateFormat('dd-MM-yy')
                                          .format(widget.booking.date_start!)
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("Check-out: ",
                                        style: TextStyle(fontSize: 12)),
                                    Text(
                                      DateFormat('dd-MM-yy')
                                          .format(widget.booking.date_end!)
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Image.network(
                            value.image!,
                            width: 130,
                            height: 100,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text("created at: ",
                              style: TextStyle(fontSize: 12)),
                          Text(
                            DateFormat('dd-MM-yy')
                                .format(widget.booking.created_at!)
                                .toString(),
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  );
          }),
    );
  }
}
