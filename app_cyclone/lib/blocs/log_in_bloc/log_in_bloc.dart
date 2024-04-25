import 'package:app_cyclone/blocs/log_in_bloc/log_in_event.dart';
import 'package:app_cyclone/blocs/log_in_bloc/log_in_state.dart';
import 'package:app_cyclone/travo_app_ac/models/user_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc() : super(LogInState.init()) {
    on<ChangeLogInEvent>((event, emit) {
      emit(LogInState(
        currentUser: event.currentUser,
        isLoading: event.isLoading,
        isSuccess: event.isSuccess,
      ));
    });
    on<UpdateUserInfo>((event, emit) {
      emit(LogInState(
          currentUser: UserInfo_(
            token: state.currentUser!.token,
            email: state.currentUser!.email,
            name: event.name,
            phone: event.phone,
            country: event.country,
          ),
          isLoading: state.isLoading,
          isSuccess: state.isSuccess));
    });
  }
}
