import 'package:app_cyclone/daily_exercise/w2-d2/counter_bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterProvider extends StatelessWidget {
  final Widget child;

  const CounterProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
        create: (BuildContext context) => CounterBloc(), child: child);
  }
}
