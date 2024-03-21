import 'package:app_cyclone/blocs/language_bloc/language_bloc.dart';
import 'package:app_cyclone/blocs/theme_bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomMultiBlocProvider extends StatelessWidget {
  final Widget child;
  const CustomMultiBlocProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<ThemeBloc>(
        create: (BuildContext context) => ThemeBloc(),
      ),
      BlocProvider(create: (BuildContext context) => LanguageBloc())
    ], child: child);
  }
}
