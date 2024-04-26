import 'package:app_cyclone/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:app_cyclone/blocs/favorite_bloc/favorite_event.dart';
import 'package:app_cyclone/blocs/favorite_bloc/favorite_state.dart';
import 'package:app_cyclone/travo_app_ac/models/place.dart';
import 'package:app_cyclone/widgets/favorite_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceListItem extends StatelessWidget {
  const PlaceListItem({super.key, required this.item});

  final Place item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      width: double.infinity,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: item.image,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              right: 0,
              child: GestureDetector(
                  onTap: () {},
                  child: BlocBuilder<FavoriteBloc, FavoriteState>(
                      builder: (context, state) => FavoriteIcon(
                            isInterested: BlocProvider.of<FavoriteBloc>(context)
                                .state
                                .places
                                .map((item) => item.image)
                                .contains(item.image),
                            onPressed: () {
                              BlocProvider.of<FavoriteBloc>(context)
                                      .state
                                      .places
                                      .map((item) => item.image)
                                      .contains(item.image)
                                  ? BlocProvider.of<FavoriteBloc>(context)
                                      .add(RemoveFavoritePlaceEvent(item))
                                  : BlocProvider.of<FavoriteBloc>(context)
                                      .add(AddFavoritePlaceEvent(item));
                            },
                          )))),
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
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 5),
                  margin: const EdgeInsets.all(5),
                  color: const Color.fromARGB(175, 255, 255, 255),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color.fromRGBO(255, 193, 7, 1),
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
