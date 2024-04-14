import 'package:app_cyclone/travo_app_ac/models/hotel.dart';
import 'package:app_cyclone/travo_app_ac/models/place.dart';
import 'package:flutter/material.dart';

class FavoriteState {
  final List<Place> places;
  final List<Hotel> hotels;

  FavoriteState({required this.places, required this.hotels});

  factory FavoriteState.initial() {
    return FavoriteState(places: [], hotels: []);
  }
}
