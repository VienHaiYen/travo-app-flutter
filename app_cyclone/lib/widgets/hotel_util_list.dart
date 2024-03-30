import 'package:flutter/material.dart';

class HotelUtil {
  HotelUtil({required this.icon, required this.name});
  final Icon icon;
  final String name;
}

class HotelUtilList extends StatelessWidget {
  const HotelUtilList({Key? key}) : super(key: key);

  static List<HotelUtil> listUtility = [
    HotelUtil(icon: const Icon(Icons.restaurant), name: "Restaurant\n"),
    HotelUtil(icon: const Icon(Icons.wifi), name: "Wifi"),
    HotelUtil(
        icon: const Icon(Icons.currency_exchange), name: "Currency\nExchange"),
    HotelUtil(icon: const Icon(Icons.receipt), name: "24-hour\nFront Desk"),
    HotelUtil(icon: const Icon(Icons.more), name: "More"),
  ];

  Widget _buildHotelUtilList({required Icon icon, required String name}) {
    return Column(
      children: [
        icon,
        const SizedBox(
          height: 10,
        ),
        Text(
          name,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: listUtility
            .map(
              (item) => _buildHotelUtilList(
                icon: item.icon,
                name: item.name,
              ),
            )
            .toList(),
      ),
    );
  }
}
