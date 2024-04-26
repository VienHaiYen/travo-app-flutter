import 'package:app_cyclone/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:app_cyclone/blocs/favorite_bloc/favorite_state.dart';
import 'package:app_cyclone/widgets/hotel_list_item.dart';
import 'package:app_cyclone/widgets/my_header.dart';
import 'package:app_cyclone/widgets/place_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Column(
            children: [
              MyHeader(
                context: context,
                title: AppLocalizations.of(context)!.favorite,
                subTitle: "Your favorite places",
              ),
              TabBar(tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.place),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.hotel),
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
