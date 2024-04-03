import 'package:app_cyclone/travo_app_ac/models/room.dart';
import 'package:app_cyclone/widgets/ColorIcon.dart';
import 'package:app_cyclone/widgets/MyDatePicker.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:app_cyclone/widgets/room_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key, required this.room});

  final Room room;

  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        body: ListView(children: [
          MyHeader(
            context: context,
            title: 'Checkout',
          ),
          RoomListItem(
            item: widget.room,
          ),
          checkoutOption(
              ColorIcon(
                  icon: Icons.people,
                  color: const Color.fromRGBO(97, 85, 204, 1),
                  bgColor: const Color.fromRGBO(224, 221, 245, 1)),
              "Contact Details",
              "Add Contact"),
          checkoutOption(
              ColorIcon(
                  icon: Icons.percent,
                  color: const Color.fromRGBO(254, 156, 94, 1),
                  bgColor: const Color.fromARGB(66, 254, 155, 94)),
              "Promo code",
              "Add Promo Code"),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Booking Date",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyDatePicker(
                        icon: ColorIcon(
                            icon: Icons.time_to_leave,
                            color: const Color.fromRGBO(247, 119, 119, 1),
                            bgColor: const Color.fromRGBO(237, 197, 197, 1)),
                        title: "Check-in",
                      ),
                      MyDatePicker(
                        icon: ColorIcon(
                          icon: Icons.time_to_leave,
                          color: const Color.fromRGBO(62, 200, 188, 1),
                          bgColor: Color.fromRGBO(62, 200, 188, 0.477),
                        ),
                        title: "Check-out",
                      )
                    ],
                  ),
                ],
              ))
        ]));
  }

  Widget checkoutOption(Widget icon, String title, String _subAdd) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              icon,
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 230,
            decoration: BoxDecoration(
              color: const Color.fromARGB(134, 224, 221, 245),
              borderRadius: BorderRadius.circular(
                40,
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.add,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  _subAdd,
                  style: const TextStyle(
                    color: Color.fromRGBO(97, 85, 204, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
