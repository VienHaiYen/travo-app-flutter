import 'dart:math' as math;

import 'package:app_cyclone/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:app_cyclone/blocs/favorite_bloc/favorite_event.dart';
import 'package:app_cyclone/blocs/favorite_bloc/favorite_state.dart';
import 'package:app_cyclone/widgets/place_list_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                context: context,
                title: AppLocalizations.of(context)!.home,
                subTitle: AppLocalizations.of(context)!.welcom_to_home),
            const SizedBox(height: 20),
            _bigButtunList(context),
            const SizedBox(height: 20),
            Expanded(
              child: ValueListenableBuilder<List<Place>>(
                valueListenable: _places,
                builder: (context, value, child) {
                  return BlocBuilder<FavoriteBloc, FavoriteState>(
                      builder: (context, state) {
                    return MasonryGridView.count(
                      physics: const ScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        VerticalIconButton(
            text: AppLocalizations.of(context)!.hotel,
            onPressed: () {
              Navigator.of(context).pushNamed('/hotel');
            },
            padding: 30,
            color: const Color.fromARGB(255, 255, 216, 157),
            icon: const Icon(
              Icons.apartment,
              size: 30,
              color: Colors.orange,
            )),
        const SizedBox(width: 30),
        VerticalIconButton(
            text: AppLocalizations.of(context)!.flights,
            onPressed: () {
              Navigator.of(context).pushNamed('/flight-detail');
            },
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
            text: AppLocalizations.of(context)!.all,
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
}
