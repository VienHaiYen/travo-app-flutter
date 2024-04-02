import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HotelUtil {
  HotelUtil({required this.icon, required this.name, this.iconBgColor});
  final Icon icon;
  final String name;
  final Color? iconBgColor;
}

class HotelUtilList extends StatelessWidget {
  HotelUtilList({super.key, required this.services});
  List<String> services;

  var HotelUtilsItem = {
    "FREE_BREAKFAST": HotelUtil(
        icon: const Icon(
          Icons.restaurant,
          color: Colors.deepPurple,
        ),
        name: "Restaurant\n",
        iconBgColor: Colors.purple[50]),
    "FREE_WIFI": HotelUtil(
        icon: const Icon(
          Icons.wifi,
          color: Colors.deepOrangeAccent,
        ),
        name: "Wifi",
        iconBgColor: const Color.fromARGB(255, 246, 231, 213)),
    "NON_REFUNDABLE": HotelUtil(
        icon: const Icon(
          Icons.currency_exchange,
          color: Colors.red,
        ),
        name: "Currency\nExchange",
        iconBgColor: const Color.fromARGB(255, 239, 210, 215)),
    "NON_SMOKING": HotelUtil(
        icon: const Icon(
          IconData(0xf3aa, fontFamily: 'MaterialIcons'),
          color: Color.fromARGB(255, 20, 116, 23),
        ),
        name: "24-hour\nFront Desk",
        iconBgColor: const Color.fromARGB(255, 202, 230, 203)),
    "more": HotelUtil(
        icon: const Icon(
          Icons.more,
          color: Color.fromARGB(255, 107, 107, 107),
        ),
        name: "More",
        iconBgColor: Colors.grey[200])
  };

  Widget _buildHotelUtilList({
    required Icon? icon,
    required String? name,
    Color? iconBgColor,
  }) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: iconBgColor ?? Colors.purple[50],
            ),
            child: icon ?? const Icon(Icons.error)),
        const SizedBox(
          height: 10,
        ),
        Text(
          name ?? "empty",
          style: const TextStyle(
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<HotelUtil?> _list =
        services.isEmpty ? [] : services.map((e) => HotelUtilsItem[e]).toList();

    return services.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _list
                    .map((item) => _buildHotelUtilList(
                        icon: item!.icon,
                        name: item.name,
                        iconBgColor: item.iconBgColor))
                    .toList()),
          )
        : Container();
  }
}
