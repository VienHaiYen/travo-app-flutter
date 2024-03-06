import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import "package:go_router/go_router.dart";
import 'w1-d1/W1D1.dart';
import 'w1-d2/W1D2.dart';
import 'w1-d3/W1D3.dart';

void main() {
  runApp(const MyMaterialApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Page1();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const Page2();
          },
        ),
      ],
    ),
  ],
);

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
