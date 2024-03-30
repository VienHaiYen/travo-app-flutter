import 'package:app_cyclone/travo_app_ac/models/place.dart';
import 'package:app_cyclone/widgets/custom_search_bar.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:app_cyclone/widgets/vertical_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<Place> places = [
    Place(
        image: "https://picsum.photos/seed/tDjV6pT4zk/640/480",
        name: "USA",
        rating: 4.8),
    Place(
        image: "https://loremflickr.com/640/480?lock=6165916672851968",
        name: "Autralia",
        rating: 4.8),
    Place(
        image: "https://picsum.photos/seed/NHbxnKgXO/640/480",
        name: "Itay",
        rating: 4.9)
  ];

  @override
  Widget build(BuildContext context) {
    print(places[0].image);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 244, 244, 244),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyHeader(
                  context: context, title: 'Home', subTitle: 'Welcome to Home'),
              const SizedBox(height: 20),
              BigButtunList(),
              Container(
                width: 500,
                height: 2000,
                child: MasonryGridView.count(
                  clipBehavior: Clip.none,
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  itemCount: places.length,
                  itemBuilder: (context, index) {
                    return Image.network(
                      places[index].image,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }

  Widget BigButtunList() {
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
            color: Color.fromARGB(255, 255, 183, 157),
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
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
          item.image,
        )),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          Column(
            children: [
              Text(
                item.name,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.start,
                    color: Colors.yellow,
                  ),
                  Text(
                    item.rating.toString(),
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
