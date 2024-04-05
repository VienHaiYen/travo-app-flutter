import 'package:app_cyclone/widgets/ColorIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HotelUtil {
  HotelUtil(
      {required this.icon,
      required this.color,
      required this.name,
      required this.iconBgColor});
  final IconData icon;
  final Color color;
  final String name;
  final Color iconBgColor;
}

class HotelUtilList extends StatelessWidget {
  HotelUtilList({super.key, required this.services});
  List<String> services;

  var HotelUtilsItem = {
    "FREE_BREAKFAST": HotelUtil(
        icon: Icons.restaurant,
        color: Colors.deepPurple,
        name: "Restaurant\n",
        iconBgColor: const Color.fromARGB(255, 182, 159, 186)),
    "FREE_WIFI": HotelUtil(
        icon: Icons.wifi,
        color: Colors.deepOrangeAccent,
        name: "Free\nWifi",
        iconBgColor: const Color.fromARGB(255, 246, 231, 213)),
    "NON_REFUNDABLE": HotelUtil(
        icon: Icons.currency_exchange,
        color: Colors.red,
        name: "Currency\nExchange",
        iconBgColor: const Color.fromARGB(255, 239, 210, 215)),
    "NON_SMOKING": HotelUtil(
        icon: const IconData(0xf3aa, fontFamily: 'MaterialIcons'),
        color: const Color.fromARGB(255, 20, 116, 23),
        name: "24-hour\nFront Desk",
        iconBgColor: const Color.fromARGB(255, 202, 230, 203)),
    "ROOM_SERVICE": HotelUtil(
        icon: Icons.room_service,
        color: const Color.fromARGB(255, 20, 20, 116),
        name: "24-hour\nFront Desk",
        iconBgColor: const Color.fromARGB(255, 165, 191, 240)),
    "more": HotelUtil(
        icon: Icons.more,
        color: const Color.fromARGB(255, 107, 107, 107),
        name: "More",
        iconBgColor: const Color.fromARGB(222, 238, 238, 238))
  };

  @override
  Widget build(BuildContext context) {
    final List<HotelUtil?> _list =
        services.isEmpty ? [] : services.map((e) => HotelUtilsItem[e]).toList();

    return services.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _list
                    .map((item) => ColorIcon(
                        color: item!.color,
                        icon: item.icon,
                        name: item.name,
                        bgColor: item.iconBgColor))
                    .toList()),
          )
        : Container();
  }
}
