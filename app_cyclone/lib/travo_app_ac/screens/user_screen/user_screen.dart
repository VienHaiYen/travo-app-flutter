import "package:app_cyclone/blocs/theme_bloc/theme_bloc.dart";
import "package:app_cyclone/blocs/theme_bloc/theme_event.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/widgets.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import "package:app_cyclone/blocs/language_bloc/language_bloc.dart";
import "package:app_cyclone/blocs/language_bloc/language_event.dart";
import "package:app_cyclone/blocs/log_in_bloc/log_in_bloc.dart";
import "package:app_cyclone/blocs/log_in_bloc/log_in_event.dart";
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
            const DropdownTranslate(),
            const SizedBox(height: 20),
            const DropdownMode(),
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
  'en',
  'vi',
];
const List<String> mode = <String>[
  'light',
  'dark',
];

class DropdownTranslate extends StatefulWidget {
  const DropdownTranslate({super.key});

  @override
  State<DropdownTranslate> createState() => DropdownTranslateState();
}

class DropdownTranslateState extends State<DropdownTranslate> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = BlocProvider.of<LanguageBloc>(context).state.locale;
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

class DropdownMode extends StatefulWidget {
  const DropdownMode({super.key});

  @override
  State<DropdownMode> createState() => DropdownModeState();
}

class DropdownModeState extends State<DropdownMode> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = BlocProvider.of<ThemeBloc>(context).state.name;
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
        onChanged: (String? value) {
          // This is called when the user selects an item.
          BlocProvider.of<ThemeBloc>(context)
              .add(ChangeThemeEvent(name: value!));
          setState(() {
            dropdownValue = value!;
            print(BlocProvider.of<ThemeBloc>(context).state.name);
          });
        },
        items: mode.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
