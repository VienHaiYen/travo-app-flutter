import 'package:app_cyclone/blocs/favorite_bloc/favorite_event.dart';
import 'package:app_cyclone/blocs/favorite_bloc/favorite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteState.initial()) {
    on<AddFavoriteEvent>((event, emit) {
      emit(FavoriteState(images: [...state.images, event.img]));
    });
    on<RemoveFavoriteEvent>((event, emit) {
      emit(FavoriteState(
          images:
              state.images.where((element) => element != event.img).toList()));
    });
  }
}
