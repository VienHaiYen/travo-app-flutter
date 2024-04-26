import 'package:app_cyclone/blocs/theme_bloc/theme_event.dart';
import 'package:app_cyclone/blocs/theme_bloc/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.light()) {
    on<ChangeThemeEvent>((event, emit) {
      emit(event.name == "dark" ? ThemeState.dark() : ThemeState.light());
    });
  }
}
