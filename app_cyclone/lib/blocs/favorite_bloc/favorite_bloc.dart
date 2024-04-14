import 'package:app_cyclone/blocs/favorite_bloc/favorite_event.dart';
import 'package:app_cyclone/blocs/favorite_bloc/favorite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteState.initial()) {
    //

    on<AddFavoritePlaceEvent>((event, emit) {
      emit(FavoriteState(
          places: [...state.places, event.place], hotels: state.hotels));
    });
    on<RemoveFavoritePlaceEvent>((event, emit) {
      emit(FavoriteState(
          places:
              state.places.where((element) => element != event.place).toList(),
          hotels: state.hotels));
    });

    //

    on<AddFavoriteHotelEvent>((event, emit) {
      emit(FavoriteState(
          hotels: [...state.hotels, event.hotel], places: state.places));
    });
    on<RemoveFavoriteHotelEvent>((event, emit) {
      emit(FavoriteState(
          hotels:
              state.hotels.where((element) => element != event.hotel).toList(),
          places: state.places));
    });
  }
}
