import 'package:app_cyclone/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:app_cyclone/blocs/favorite_bloc/favorite_event.dart';
import 'package:app_cyclone/travo_app_ac/models/place.dart';
import 'package:app_cyclone/widgets/favorite_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceListItem extends StatelessWidget {
  const PlaceListItem({super.key, required this.item});

  final Place item;

  @override
  Widget build(BuildContext context) {
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
                  onTap: () {},
                  child: FavoriteIcon(
                    isInterested: BlocProvider.of<FavoriteBloc>(context)
                        .state
                        .places
                        .contains(item),
                    onPressed: () {
                      BlocProvider.of<FavoriteBloc>(context)
                              .state
                              .places
                              .contains(item)
                          ? BlocProvider.of<FavoriteBloc>(context)
                              .add(RemoveFavoriteEvent(item))
                          : BlocProvider.of<FavoriteBloc>(context)
                              .add(AddFavoriteEvent(item));
                    },
                  ))
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
