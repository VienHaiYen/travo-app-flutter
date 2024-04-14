import 'dart:math' as math;

import 'package:app_cyclone/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:app_cyclone/blocs/favorite_bloc/favorite_state.dart';
import 'package:app_cyclone/blocs/log_in_bloc/log_in_bloc.dart';
import 'package:app_cyclone/travo_app_ac/models/account_info.dart';
import 'package:app_cyclone/travo_app_ac/models/user_info.dart';
import 'package:app_cyclone/travo_app_ac/service/account_service.dart';
import 'package:app_cyclone/widgets/place_list_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:app_cyclone/travo_app_ac/models/place.dart';
import 'package:app_cyclone/travo_app_ac/service/place_service.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:app_cyclone/widgets/vertical_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

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
  final ValueNotifier<AccountInfo?> acc = ValueNotifier<AccountInfo?>(null);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void getPlaces() async {
    _places.value = await PlaceService.fetchData();
  }

  UserInfo_? get user => BlocProvider.of<LogInBloc>(context).state.currentUser;

  void getAccount() async {
    acc.value = await AccountService.fetchData(user!.email);
  }

  @override
  Widget build(BuildContext context) {
    getPlaces();
    getAccount();

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        body: Column(
          children: [
            MyHeader(
              topWidget: ValueListenableBuilder<AccountInfo?>(
                valueListenable: acc,
                builder: (context, value, child) {
                  return value == null
                      ? Container()
                      : Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 5),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                        text: TextSpan(
                                            text: "Hi, ",
                                            style: TextStyle(
                                              fontSize: 30,
                                              fontFamily:
                                                  GoogleFonts.montserrat(
                                                          fontWeight:
                                                              FontWeight.bold)
                                                      .fontFamily,
                                            ),
                                            children: [
                                          TextSpan(text: value.name)
                                        ])),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "Where are you going next?",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(
                                CupertinoIcons.bell,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              const SizedBox(width: 20),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  "https://media.istockphoto.com/id/1295497300/photo/sakura-for-valentines-day-raster.jpg?s=612x612&w=0&k=20&c=QA7gEkUajfIp53kERLv6uv2ZE7gwMzBOLoG-cMMFkVE=",
                                  width: 50,
                                  height: 50,
                                ),
                              )
                            ],
                          ),
                        );
                },
              ),
              context: context,
            ),
            const SizedBox(height: 10),
            _bigButtunList(context),
            // const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Destinations",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: null,
                      child: Text(
                        "See all",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(97, 85, 204, 1),
                            fontWeight: FontWeight.w600),
                      ))
                ],
              ),
            ),
            Expanded(
              child: ValueListenableBuilder<List<Place>>(
                valueListenable: _places,
                builder: (context, value, child) {
                  return _places.value.length == 0
                      ? Column(
                          children: [
                            const CircularProgressIndicator(),
                            Expanded(child: Container())
                          ],
                        )
                      : BlocBuilder<FavoriteBloc, FavoriteState>(
                          builder: (context, state) {
                          return MasonryGridView.count(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            physics: const ScrollPhysics(),
                            crossAxisCount: 2,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 2,
                            itemCount: _places.value.length,
                            itemBuilder: (context, index) {
                              return PlaceListItem(item: _places.value[index]);
                            },
                          );
                        });
                },
              ),
            )
          ],
        ));
  }

  Widget _bigButtunList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VerticalIconButton(
              text: AppLocalizations.of(context)!.hotel,
              onPressed: () {
                Navigator.of(context).pushNamed('/hotel');
              },
              padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 30),
              color: const Color.fromARGB(61, 254, 155, 94),
              icon: const Icon(
                Icons.apartment,
                size: 30,
                color: Color.fromRGBO(254, 156, 94, 1),
              )),
          const SizedBox(width: 20),
          VerticalIconButton(
              text: AppLocalizations.of(context)!.flights,
              onPressed: () {
                Navigator.of(context).pushNamed('/flight-detail');
              },
              padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 30),
              color: const Color.fromARGB(62, 247, 119, 119),
              angle: math.pi / 6,
              icon: const Icon(
                Icons.flight,
                size: 30,
                color: Color.fromRGBO(247, 119, 119, 1),
              )),
          const SizedBox(width: 20),
          VerticalIconButton(
              text: AppLocalizations.of(context)!.all,
              onPressed: () {},
              padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 30),
              color: const Color.fromARGB(53, 62, 200, 188),
              icon: const Icon(
                Icons.apartment,
                size: 30,
                color: Color.fromRGBO(62, 200, 188, 1),
              ))
        ],
      ),
    );
  }
}
