import 'package:app_cyclone/travo_app_ac/models/place.dart';

abstract class FavoriteEvent {}

class AddFavoriteEvent extends FavoriteEvent {
  final Place place;

  AddFavoriteEvent(this.place);
}

class RemoveFavoriteEvent extends FavoriteEvent {
  final Place place;

  RemoveFavoriteEvent(this.place);
}
