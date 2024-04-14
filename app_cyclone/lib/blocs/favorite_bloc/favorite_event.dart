import 'package:app_cyclone/travo_app_ac/models/hotel.dart';
import 'package:app_cyclone/travo_app_ac/models/place.dart';

abstract class FavoriteEvent {}

class AddFavoritePlaceEvent extends FavoriteEvent {
  final Place place;

  AddFavoritePlaceEvent(this.place);
}

class RemoveFavoritePlaceEvent extends FavoriteEvent {
  final Place place;

  RemoveFavoritePlaceEvent(this.place);
}

class AddFavoriteHotelEvent extends FavoriteEvent {
  final Hotel hotel;

  AddFavoriteHotelEvent(this.hotel);
}

class RemoveFavoriteHotelEvent extends FavoriteEvent {
  final Hotel hotel;

  RemoveFavoriteHotelEvent(this.hotel);
}
