import 'dart:math' as math;

import 'package:app_cyclone/travo_app_ac/models/place.dart';
import 'package:app_cyclone/travo_app_ac/service/place_service.dart';
import 'package:app_cyclone/widgets/custom_search_bar.dart';
import 'package:app_cyclone/widgets/favorite_icon.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:app_cyclone/widgets/vertical_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Tile extends StatelessWidget {
  Tile({super.key, this.index, this.extent});

  final int? index;
  final double? extent;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.yellow, height: extent, child: Text(index.toString()));
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  final ValueNotifier<List<Place>> _places = ValueNotifier<List<Place>>([]);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void getPlaces() async {
    _places.value = await PlaceService.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    getPlaces();

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        body: Column(
          children: [
            MyHeader(
                context: context, title: 'Home', subTitle: 'Welcome to Home'),
            const SizedBox(height: 20),
            _bigButtunList(),
            const SizedBox(height: 20),
            Expanded(
              child: ValueListenableBuilder<List<Place>>(
                valueListenable: _places,
                builder: (context, value, child) {
                  return MasonryGridView.count(
                    physics: const ScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    itemCount: _places.value.length,
                    itemBuilder: (context, index) {
                      return placeItem(_places.value[index]);
                      // return Image.network(
                      //   _places.value[index].image,
                      //   fit: BoxFit.cover,
                      // );
                    },
                  );
                },
              ),
            )
          ],
        ));
  }

  Widget _bigButtunList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/hotel');
          },
          child: VerticalIconButton(
              text: "Hotels",
              onPressed: () {},
              padding: 30,
              color: const Color.fromARGB(255, 255, 216, 157),
              icon: const Icon(
                Icons.apartment,
                size: 30,
                color: Colors.orange,
              )),
        ),
        const SizedBox(width: 30),
        VerticalIconButton(
            text: "Flights",
            onPressed: () {},
            padding: 30,
            color: const Color.fromARGB(255, 255, 183, 157),
            angle: math.pi / 6,
            icon: const Icon(
              Icons.flight,
              size: 30,
              color: Color.fromARGB(255, 255, 77, 0),
            )),
        const SizedBox(width: 30),
        VerticalIconButton(
            text: "All",
            onPressed: () {},
            padding: 30,
            color: const Color.fromARGB(255, 162, 216, 178),
            icon: const Icon(
              Icons.apartment,
              size: 30,
              color: Color.fromARGB(255, 0, 157, 45),
            ))
      ],
    );
  }

  Widget placeItem(Place item) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      width: double.infinity,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              item.image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              right: 0,
              child: GestureDetector(
                  onTap: () {}, child: FavoriteIcon(isInterested: false))
              // child: const FavoriteIcon(isInterested: true)),
              ),
          Positioned(
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 5),
                  margin: const EdgeInsets.all(5),
                  color: Colors.white.withOpacity(0.5),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 254, 218, 38),
                      ),
                      Text(
                        item.rating.toString(),
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
