import 'package:app_cyclone/w2-d3/blocs/language_bloc/language_bloc.dart';
import 'package:app_cyclone/w2-d3/blocs/language_bloc/language_state.dart';
import 'package:app_cyclone/w2-d3/blocs/theme_bloc/theme_bloc.dart';
import 'package:app_cyclone/w3-d1/W3D1.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:app_cyclone/w2-d1/W2D1.dart';
// import 'package:app_cyclone/w2-d2/W2D2.dart';
import 'package:app_cyclone/w2-d3/W2D3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import "package:go_router/go_router.dart";
import 'w1-d1/W1D1.dart';
import 'w1-d2/W1D2.dart';
import 'w1-d3/W1D3.dart';

void main() {
  runApp(const MyMaterialApp());
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              lazy: false, create: (BuildContext context) => ThemeBloc()),
          BlocProvider(
              lazy: false, create: (BuildContext context) => LanguageBloc())
        ],
        child:
            BlocBuilder<LanguageBloc, LanguageState>(builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: const [
              Locale('en'), // English
              Locale('vi'), // Vietnamese
            ],
            locale: Locale(BlocProvider.of<LanguageBloc>(context).state.locale),
            title: 'Flutter Workshop',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: W3D1(),
          );
        }));
  }
}
