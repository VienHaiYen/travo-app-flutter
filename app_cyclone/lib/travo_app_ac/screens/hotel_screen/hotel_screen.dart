import 'dart:async';

import 'package:app_cyclone/widgets/custom_search_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier<List<Hotel>> _hotels = ValueNotifier<List<Hotel>>([]);

  final StreamController<List<Hotel>> _streamController =
      StreamController<List<Hotel>>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }

  void getHotels() async {
    searchFunction("");
  }

  void searchFunction(String str) async {
    // Simulate loading data from an API or other source
    _hotels.value = await HotelService.searchData(str);

    if (_hotels.value.isEmpty) {
      _streamController.addError("No data found");
    } else {
      _streamController.add(_hotels.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    getHotels();

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        body: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: MyHeader(
                    context: context,
                    title: AppLocalizations.of(context)!.hotel,
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 25,
                    child: CustomSearchBar(
                        searchController: _searchController,
                        onChanged: searchFunction,
                        placeholder: "Search hotel"))
              ],
            ),
            Expanded(
              child: StreamBuilder<List<Hotel>>(
                  stream: _streamController.stream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting ||
                        snapshot.data == null && snapshot.hasError == false) {
                      return Column(
                        children: [
                          const CircularProgressIndicator(),
                          Expanded(child: Container())
                        ],
                      ); // Hiển thị indicator khi đang đợi dữ liệu
                    } else if (snapshot.hasError) {
                      return Text(
                          'Error: ${snapshot.error}'); // Hiển thị thông báo lỗi
                    } else {
                      return ListView.builder(
                          physics: const ScrollPhysics(),
                          itemCount: _hotels.value.length,
                          itemBuilder: (BuildContext context, int index) {
                            return HotelListItem(
                              item: _hotels.value[index],
                              onTap: () {
                                Navigator.of(context).pushNamed("/room",
                                    arguments: _hotels.value[index].id);
                              },
                            );
                          });
                    }
                  }),
            )
            // ------------

            // Expanded(
            //   child: ValueListenableBuilder<List<Hotel>>(
            //       valueListenable: _hotels,
            //       builder: (context, value, child) {
            //         return ListView.builder(
            //             physics: const ScrollPhysics(),
            //             itemCount: _hotels.value.length,
            //             itemBuilder: (BuildContext context, int index) {
            //               return HotelListItem(
            //                 item: _hotels.value[index],
            //                 onTap: () {
            //                   Navigator.of(context).pushNamed("/room",
            //                       arguments: _hotels.value[index].id);
            //                 },
            //               );
            //             });
            //       }),
            // )
          ],
        ));
  }
}
