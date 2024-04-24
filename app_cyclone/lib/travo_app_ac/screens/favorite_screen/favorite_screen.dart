import 'package:app_cyclone/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:app_cyclone/blocs/favorite_bloc/favorite_state.dart';
import 'package:app_cyclone/widgets/hotel_list_item.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:app_cyclone/widgets/place_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        body: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Column(
            children: [
              MyHeader(
                context: context,
                title: "Favorite",
                subTitle: "Your favorite places",
              ),
              const TabBar(tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Places"),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Hotels"),
                    ],
                  ),
                ),
              ]),
              Expanded(
                child: TabBarView(children: [
                  BlocBuilder<FavoriteBloc, FavoriteState>(
                      builder: (context, state) => ListView(
                          children: BlocProvider.of<FavoriteBloc>(context)
                              .state
                              .places
                              .map((e) => PlaceListItem(item: e))
                              .toList())),
                  BlocBuilder<FavoriteBloc, FavoriteState>(
                      builder: (context, state) => ListView(
                          children: BlocProvider.of<FavoriteBloc>(context)
                              .state
                              .hotels
                              .map((e) => HotelListItem(item: e))
                              .toList())),
                ]),
              )
            ],
          ),
        ));
  }
}
