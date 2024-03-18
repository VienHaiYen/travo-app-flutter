import 'package:app_cyclone/w2-d1/widget/my_app_bar.dart';
import 'package:app_cyclone/w2-d3/blocs/theme_bloc/theme_bloc.dart';
import 'package:app_cyclone/w2-d3/blocs/theme_bloc/theme_event.dart';
import 'package:app_cyclone/w2-d3/blocs/theme_bloc/theme_provider.dart';
import 'package:app_cyclone/w2-d3/blocs/theme_bloc/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class W2D3 extends StatelessWidget {
  const W2D3({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(child: BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
            appBar: MyAppBar(title: "Theme Bloc", showBackButton: false),
            body: Container(
              width: double.infinity,
              color: state.backgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Theme: ${state.name}",
                    style: TextStyle(color: state.textColor),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ThemeBloc>().add(ChangeThemeEvent());
                    },
                    child: const Text("Change Theme"),
                  ),
                ],
              ),
            ));
      },
    ));
  }
}
