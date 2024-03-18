import 'package:app_cyclone/w2-d3/blocs/theme_bloc/theme_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeProvider extends StatelessWidget {
  final Widget child;
  const ThemeProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
        create: (BuildContext context) => ThemeBloc(), child: child);
  }
}
