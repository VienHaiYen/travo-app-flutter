import 'package:app_cyclone/travo_app_ac/models/hotel.dart';
import 'package:app_cyclone/travo_app_ac/service/hotel_service.dart';
import 'package:app_cyclone/widgets/hotel_list_item.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HotelScreen extends StatefulWidget {
  HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  TextEditingController _searchController = TextEditingController();
  final ValueNotifier<List<Hotel>> _hotels = ValueNotifier<List<Hotel>>([]);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void getHotels() async {
    _hotels.value = await HotelService.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    getHotels();

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        body: Column(
          children: [
            MyHeader(
              context: context,
              title: 'Hotels',
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ValueListenableBuilder<List<Hotel>>(
                  valueListenable: _hotels,
                  builder: (context, value, child) {
                    return ListView.builder(
                        physics: const ScrollPhysics(),
                        itemCount: _hotels.value.length,
                        itemBuilder: (BuildContext context, int index) {
                          return HotelListItem(
                            item: _hotels.value[index],
                            onTap: () {
                              Navigator.of(context).pushNamed("/room");
                            },
                          );
                        });
                  }),
            )
          ],
        ));
  }
}
