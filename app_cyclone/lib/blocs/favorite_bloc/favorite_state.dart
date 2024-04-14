import 'package:app_cyclone/travo_app_ac/models/place.dart';
import 'package:flutter/material.dart';

class FavoriteState {
  final List<Place> places;

  FavoriteState({required this.places});

  factory FavoriteState.initial() {
    return FavoriteState(places: []);
  }
}
