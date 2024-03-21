import 'package:app_cyclone/daily_exercise/w2-d1/widget/my_app_bar.dart';
import 'package:app_cyclone/daily_exercise/w2-d2/counter_bloc/counter_bloc.dart';
import 'package:app_cyclone/daily_exercise/w2-d2/counter_bloc/counter_event.dart';
import 'package:app_cyclone/daily_exercise/w2-d2/counter_bloc/counter_provider.dart';
import 'package:app_cyclone/daily_exercise/w2-d2/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class W2D2 extends StatelessWidget {
  const W2D2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      child: Scaffold(
          appBar: const MyAppBar(title: "BloC", showBackButton: true),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
            child: BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Text("Counter: ${state.count}",
                        style: Theme.of(context).textTheme.headline3),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            context.read<CounterBloc>().add(IncrementEvent());
                          },
                          child: const Text("Increment"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            context.read<CounterBloc>().add(DecrementEvent());
                          },
                          child: const Text("Decrement"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            context.read<CounterBloc>().add(SetToZeroEvent());
                          },
                          child: const Text("Reset to 0"),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          )),
    );
  }
}
