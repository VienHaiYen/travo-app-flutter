import 'package:app_cyclone/blocs/log_in_bloc/log_in_bloc.dart';
import 'package:app_cyclone/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:app_cyclone/blocs/language_bloc/language_bloc.dart';
import 'package:app_cyclone/blocs/language_bloc/language_state.dart';
import 'package:app_cyclone/blocs/theme_bloc/theme_bloc.dart';
import 'package:app_cyclone/firebase_options.dart';
import 'package:app_cyclone/routes/routes.dart';
import 'package:app_cyclone/travo_app_ac/screens/authen_screen/authen_screen.dart';
import 'package:app_cyclone/travo_app_ac/screens/authen_screen/login_screen.dart';
import 'package:app_cyclone/travo_app_ac/screens/onboarding_screen/onboarding_carousel.dart';
import 'package:app_cyclone/travo_app_ac/screens/splash_screen/splash__screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:app_cyclone/daily_exercise/w2-d3/W2D3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:app_cyclone/w2-d1/W2D1.dart';
// import 'package:app_cyclone/w2-d2/W2D2.dart';
import "package:go_router/go_router.dart";
import 'daily_exercise/w3-d1/W3D1.dart';
import 'daily_exercise/w1-d1/W1D1.dart';
import 'daily_exercise/w1-d2/W1D2.dart';
import 'daily_exercise/w1-d3/W1D3.dart';

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
          BlocProvider(create: (BuildContext context) => ThemeBloc()),
          BlocProvider(create: (BuildContext context) => LanguageBloc()),
          BlocProvider(create: (BuildContext context) => LogInBloc()),
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
            onGenerateRoute: Routes.instance.routePage,
            initialRoute: '/splash-screen',
            home: const SplashScreen(),
          );
        }));
  }
}
