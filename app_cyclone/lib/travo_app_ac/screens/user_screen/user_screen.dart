import "package:app_cyclone/blocs/log_in_bloc/log_in_bloc.dart";
import "package:app_cyclone/blocs/log_in_bloc/log_in_event.dart";
import "package:app_cyclone/blocs/log_in_bloc/log_in_state.dart";
import "package:app_cyclone/routes/route_name.dart";
import "package:app_cyclone/widgets/button.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:provider/provider.dart";

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogInBloc, LogInState>(builder: (context, state) {
      return Center(
          child: Button(
              text: "Log out",
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RouteName.logIn,
                  (route) => false,
                );
                BlocProvider.of<LogInBloc>(context).add(ChangeLogInEvent(
                    currentUser: null, isLoading: false, isSuccess: false));
                // authProvider.token = "";
              }));
    });
  }
}
