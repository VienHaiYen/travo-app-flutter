import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import "package:app_cyclone/blocs/language_bloc/language_bloc.dart";
import "package:app_cyclone/blocs/language_bloc/language_event.dart";
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButtonExample(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     ElevatedButton(
          //       style: ElevatedButton.styleFrom(
          //         backgroundColor: Colors.blueGrey,
          //       ),
          //       onPressed: () {
          //         BlocProvider.of<LanguageBloc>(context)
          //             .add(ChangeLanguage("en"));
          //       },
          //       child: Text(AppLocalizations.of(context)!.english,
          //           style: const TextStyle(color: Colors.white)),
          //     ),
          //     const SizedBox(width: 10),
          //     ElevatedButton(
          //       style: ElevatedButton.styleFrom(
          //         backgroundColor: Colors.deepOrange,
          //       ),
          //       onPressed: () {
          //         BlocProvider.of<LanguageBloc>(context)
          //             .add(ChangeLanguage("vi"));
          //       },
          //       child: Text(AppLocalizations.of(context)!.vietnamese,
          //           style: const TextStyle(color: Colors.white)),
          //     ),
          //   ],
          // ),
          Button(
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
              }),
        ],
      ),
    );
  }
}

const List<String> list = <String>[
  'vi',
  'en',
];

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        BlocProvider.of<LanguageBloc>(context).add(ChangeLanguage(value!));
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
