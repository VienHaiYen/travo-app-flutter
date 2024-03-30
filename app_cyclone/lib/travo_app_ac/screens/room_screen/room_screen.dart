import 'package:app_cyclone/travo_app_ac/models/room.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:app_cyclone/widgets/room_list_item.dart';
import 'package:flutter/material.dart';

class RoomScreen extends StatefulWidget {
  const RoomScreen({Key? key}) : super(key: key);

  static const String routeName = '/rooms_screen';

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  final List<Room> listRoom = [
    Room(
        image: "https://picsum.photos/seed/HV7Gq/640/480",
        name: 'Executive Suite',
        maxGuest: 4,
        services: [
          "FREE_WIFI",
          "NON_REFUNDABLE",
          "FREE_BREAKFAST",
          "NON_SMOKING"
        ],
        price: 500,
        total: 5),
    Room(
        image: "https://picsum.photos/seed/HV7Gq/640/480",
        name: 'Executive Suite',
        maxGuest: 4,
        services: [
          "FREE_WIFI",
          "NON_REFUNDABLE",
          "FREE_BREAKFAST",
          "NON_SMOKING"
        ],
        price: 500,
        total: 5),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 244, 244, 244),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyHeader(
                context: context,
                title: 'Select Room',
              ),
              const SizedBox(height: 20),
              ...listRoom.map((item) => RoomListItem(item: item)).toList()
            ],
          ),
        ));
  }
}
