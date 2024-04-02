import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:app_cyclone/widgets/my_app_bar.dart';
import 'package:app_cyclone/blocs/language_bloc/language_bloc.dart';
import 'package:app_cyclone/blocs/language_bloc/language_event.dart';
import 'package:app_cyclone/blocs/theme_bloc/theme_bloc.dart';
import 'package:app_cyclone/blocs/theme_bloc/theme_event.dart';
import 'package:app_cyclone/blocs/theme_bloc/theme_provider.dart';
import 'package:app_cyclone/blocs/theme_bloc/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_cyclone/blocs/custom_multi_bloc_provider.dart';

class W2D3 extends StatelessWidget {
  const W2D3({super.key});

  @override
  Widget build(BuildContext context) {
    return MyWidget();
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return Scaffold(
          appBar: const MyAppBar(
              title: "Theme & Localization Bloc", showBackButton: false),
          body: Container(
            width: double.infinity,
            color: BlocProvider.of<ThemeBloc>(context).state.backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Theme: ${BlocProvider.of<ThemeBloc>(context).state.name == ThemeState.light().name ? AppLocalizations.of(context)!.light_mode : AppLocalizations.of(context)!.dark_mode}",
                      style: TextStyle(
                        color:
                            BlocProvider.of<ThemeBloc>(context).state.textColor,
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amberAccent,
                      ),
                      onPressed: () {
                        BlocProvider.of<ThemeBloc>(context)
                            .add(ChangeThemeEvent());
                      },
                      child: Text(AppLocalizations.of(context)!.change_mode),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                      ),
                      onPressed: () {
                        BlocProvider.of<LanguageBloc>(context)
                            .add(ChangeLanguage("en"));
                      },
                      child: Text(AppLocalizations.of(context)!.english,
                          style: const TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                      ),
                      onPressed: () {
                        BlocProvider.of<LanguageBloc>(context)
                            .add(ChangeLanguage("vi"));
                      },
                      child: Text(AppLocalizations.of(context)!.vietnamese,
                          style: const TextStyle(color: Colors.white)),
                    ),
                  ],
                )
              ],
            ),
          ));
    });
  }
}
