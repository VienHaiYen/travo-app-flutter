import 'package:app_cyclone/w2-d3/blocs/theme_bloc/theme_event.dart';
import 'package:app_cyclone/w2-d3/blocs/theme_bloc/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.light()) {
    on<ChangeThemeEvent>((event, emit) {
      emit(state.name == ThemeState.light().name
          ? ThemeState.dark()
          : ThemeState.light());
    });
  }
}
