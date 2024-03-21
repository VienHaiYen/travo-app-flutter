import 'package:app_cyclone/routes/route_name.dart';
import 'package:app_cyclone/routes/routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(RouteName.onboardingCarousel);
      },
      child: const Image(
        image: AssetImage('assets/images/splash_screen.jpg'),
        fit: BoxFit.cover,
      ),
    );
  }
}
