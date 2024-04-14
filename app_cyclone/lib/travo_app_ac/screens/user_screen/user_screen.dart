import "package:flutter/cupertino.dart";
import "package:flutter/widgets.dart";
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
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.blueGrey, width: 3),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  "https://media.istockphoto.com/id/1295497300/photo/sakura-for-valentines-day-raster.jpg?s=612x612&w=0&k=20&c=QA7gEkUajfIp53kERLv6uv2ZE7gwMzBOLoG-cMMFkVE=",
                  height: 200,
                  width: 200,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
                alignment: Alignment.centerLeft,
                child: Text(AppLocalizations.of(context)!.tranlate)),
            const SizedBox(height: 5),
            const DropdownButtonExample(),
            const SizedBox(height: 20),
            Button(
                isFullWidth: true,
                text: AppLocalizations.of(context)!.log_out,
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
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
      ),
    );
  }
}
