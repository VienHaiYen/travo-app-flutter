import 'package:app_cyclone/blocs/log_in_bloc/log_in_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInProvider extends StatelessWidget {
  final Widget child;
  const LogInProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LogInBloc>(
        create: (BuildContext context) => LogInBloc(), child: child);
  }
}
