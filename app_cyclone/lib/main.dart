import 'package:app_cyclone/blocs/booking_flight_info_bloc/booking_flight_info_bloc.dart';
import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_bloc.dart';
import 'package:app_cyclone/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:app_cyclone/blocs/log_in_bloc/log_in_bloc.dart';
import 'package:app_cyclone/blocs/language_bloc/language_bloc.dart';
import 'package:app_cyclone/blocs/language_bloc/language_state.dart';
import 'package:app_cyclone/blocs/theme_bloc/theme_bloc.dart';
import 'package:app_cyclone/blocs/theme_bloc/theme_state.dart';
import 'package:app_cyclone/firebase_options.dart';
import 'package:app_cyclone/routes/routes.dart';
import 'package:app_cyclone/theme/my_theme.dart';
import 'package:app_cyclone/travo_app_ac/screens/splash_screen/splash__screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyMaterialApp());
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          //
          BlocProvider(create: (BuildContext context) => LogInBloc()),
          //
          BlocProvider(create: (BuildContext context) => ThemeBloc()),
          BlocProvider(create: (BuildContext context) => LanguageBloc()),
          // de tam o day, cho lat chuyen di
          BlocProvider(create: (BuildContext context) => FavoriteBloc()),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
          return BlocBuilder<LanguageBloc, LanguageState>(
              builder: (context, state) {
            return MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: const [
                Locale('en'), // English
                Locale('vi'), // Vietnamese
              ],
              locale:
                  Locale(BlocProvider.of<LanguageBloc>(context).state.locale),
              title: 'Flutter Workshop',
              theme: MyTheme.lightTheme,
              darkTheme: MyTheme.darkTheme,
              themeMode:
                  BlocProvider.of<ThemeBloc>(context).state.name == 'dark'
                      ? ThemeMode.dark
                      : ThemeMode.light,
              // themeMode: ThemeMode.dark,
              onGenerateRoute: Routes.instance.routePage,
              initialRoute: '/splash-screen',
              home: const SplashScreen(),
            );
          });
        }));
  }
}
