import 'package:app_cyclone/travo_app_ac/models/hotel.dart';
import 'package:app_cyclone/widgets/button.dart';
import 'package:app_cyclone/widgets/custom_search_bar.dart';
import 'package:app_cyclone/widgets/hotel_list_item.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:app_cyclone/widgets/vertical_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HotelScreen extends StatelessWidget {
  HotelScreen({super.key});

  TextEditingController _searchController = TextEditingController();

  final List<Hotel> listHotel = [
    Hotel(
        image: "https://picsum.photos/seed/3cxEKyXWh/640/480",
        name: 'Royal Palm Heritage',
        location: 'Purwokerto, Jateng',
        awayKilometer: '364 m',
        rating: 4.5,
        totalReview: 3241,
        price: 143,
        locationDescription:
            "Golden Horizon Retreat is perched on Santorini island in Greece",
        information:
            "Experience the magic of Santorini at the Golden Horizon Retreat. Perched on the cliffs with panoramic views of the Aegean Sea, this retreat is a sanctuary of elegance and beauty. Enjoy Greek cuisine, bask in the sunsets, and let the charm of Santorini enchant your senses."),
    Hotel(
        image: "https://picsum.photos/seed/3cxEKyXWh/640/480",
        name: 'Grand Luxury\'s',
        location: 'Banyumas, Jateng',
        awayKilometer: '2.3 km',
        rating: 4.2,
        totalReview: 3241,
        locationDescription:
            "Golden Horizon Retreat is perched on Santorini island in Greece",
        price: 234,
        information:
            "Experience the magic of Santorini at the Golden Horizon Retreat. Perched on the cliffs with panoramic views of the Aegean Sea, this retreat is a sanctuary of elegance and beauty. Enjoy Greek cuisine, bask in the sunsets, and let the charm of Santorini enchant your senses."),
    Hotel(
        image: "https://picsum.photos/seed/3cxEKyXWh/640/480",
        name: 'The Orlando House',
        location: 'Ajibarang, Jateng',
        awayKilometer: '1.1 km',
        rating: 3.8,
        totalReview: 1234,
        price: 132,
        locationDescription:
            "Golden Horizon Retreat is perched on Santorini island in Greece",
        information:
            "Experience the magic of Santorini at the Golden Horizon Retreat. Perched on the cliffs with panoramic views of the Aegean Sea, this retreat is a sanctuary of elegance and beauty. Enjoy Greek cuisine, bask in the sunsets, and let the charm of Santorini enchant your senses."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 244, 244, 244),
        body: SingleChildScrollView(
          child: Stack(children: [
            Column(
              children: [
                MyHeader(
                  context: context,
                  title: 'Hotels',
                ),
                const SizedBox(height: 20),
                ...listHotel
                    .map((item) => HotelListItem(
                          item: item,
                          onTap: () {
                            Navigator.of(context).pushNamed("/room");
                          },
                        ))
                    .toList()
              ],
            ),
          ]),
        ));
  }
}
