abstract class FavoriteEvent {}

class AddFavoriteEvent extends FavoriteEvent {
  final String img;

  AddFavoriteEvent(this.img);
}

class RemoveFavoriteEvent extends FavoriteEvent {
  final String img;

  RemoveFavoriteEvent(this.img);
}
