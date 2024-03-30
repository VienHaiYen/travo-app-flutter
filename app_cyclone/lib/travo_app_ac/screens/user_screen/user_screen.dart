import "package:app_cyclone/providers/auth_provider.dart";
import "package:app_cyclone/routes/route_name.dart";
import "package:app_cyclone/widgets/button.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<MyAuthProvider>();

    return Center(
        child: Button(
            text: "Log out",
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteName.logIn,
                (route) => false,
              );
              authProvider.token = "";
            }));
  }
}
