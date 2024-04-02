import 'package:app_cyclone/travo_app_ac/models/user_info.dart';

class LogInState {
  final UserInfo_? currentUser;
  final bool isLoading;
  final bool isSuccess;

  UserInfo_ empty = UserInfo_();
  LogInState({
    this.currentUser,
    required this.isLoading,
    required this.isSuccess,
  });
  factory LogInState.init() {
    return LogInState(
      isLoading: false,
      isSuccess: false,
    );
  }

  factory LogInState.isLoading() {
    return LogInState(
      isLoading: true,
      isSuccess: false,
    );
  }

  factory LogInState.isSuccess() {
    return LogInState(
      isLoading: false,
      isSuccess: true,
    );
  }
  factory LogInState.isFailure() {
    return LogInState(
      isLoading: false,
      isSuccess: false,
    );
  }
}
