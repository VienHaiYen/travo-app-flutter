import 'package:app_cyclone/blocs/language_bloc/language_event.dart';
import 'package:app_cyclone/blocs/language_bloc/language_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState.initial()) {
    on<ChangeLanguage>((event, emit) {
      emit(LanguageState(locale: event.locale));
    });
  }
}
