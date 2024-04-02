import 'package:app_cyclone/travo_app_ac/models/user_info.dart';

abstract class LogInEvent {}

class ChangeLogInEvent extends LogInEvent {
  final bool isLoading;
  final bool isSuccess;
  final UserInfo_? currentUser;

  ChangeLogInEvent({
    this.currentUser,
    required this.isLoading,
    required this.isSuccess,
  });
}
