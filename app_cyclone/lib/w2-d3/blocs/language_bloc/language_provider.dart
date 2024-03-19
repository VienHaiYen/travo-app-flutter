import 'package:app_cyclone/w2-d3/blocs/language_bloc/language_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageProvider extends StatelessWidget {
  final Widget child;

  const LanguageProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LanguageBloc>(
        create: (BuildContext context) => LanguageBloc(), child: child);
  }
}
