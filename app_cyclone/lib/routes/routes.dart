import 'package:app_cyclone/routes/route_name.dart';
import 'package:app_cyclone/travo_app_ac/layouts/bottom_navigation_layout/bottom_navigation_layout.dart';
import 'package:app_cyclone/travo_app_ac/models/hotel.dart';
import 'package:app_cyclone/travo_app_ac/models/room.dart';
import 'package:app_cyclone/travo_app_ac/screens/authen_screen/forgot_password.dart';
import 'package:app_cyclone/travo_app_ac/screens/authen_screen/login_screen.dart';
import 'package:app_cyclone/travo_app_ac/screens/authen_screen/signup_screen.dart';
import 'package:app_cyclone/travo_app_ac/screens/check_out_screen/check_out_screen.dart';
import 'package:app_cyclone/travo_app_ac/screens/detail_hotel_screen/detail_hotel_screen.dart';
import 'package:app_cyclone/travo_app_ac/screens/home_screen/home_screen.dart';
import 'package:app_cyclone/travo_app_ac/screens/hotel_screen/hotel_screen.dart';
import 'package:app_cyclone/travo_app_ac/screens/onboarding_screen/onboarding_carousel.dart';
import 'package:app_cyclone/travo_app_ac/screens/room_screen/room_screen.dart';
import 'package:app_cyclone/travo_app_ac/screens/splash_screen/splash__screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Routes instance = Routes();

  PageRoute routePage(RouteSettings settings) {
    return _buildRoute(settings);
  }

  PageRoute<dynamic> _buildRoute(RouteSettings settings) {
    MaterialPageRoute getRoute(Widget screen) {
      return MaterialPageRoute(
          settings: settings, builder: (context) => screen);
    }

    final args = settings.arguments;

    switch (settings.name) {
      case RouteName.splashScreen:
        return getRoute(const SplashScreen());
      case RouteName.onboardingCarousel:
        return getRoute(CarouselDemo());
      case RouteName.logIn:
        return getRoute(LoginScreen());
      case RouteName.signUp:
        return getRoute(SignupScreen());
      case RouteName.forgotPassword:
        return getRoute(ForgotPasswordScreen());
      case RouteName.home:
        return getRoute(const BottomNavigationLayout(
          pageIndex: 0,
        ));
      case RouteName.hotel:
        return getRoute(HotelScreen());
      case RouteName.hotelDetail:
        return getRoute(DetailHotelScreen(item: args as Hotel));
      case RouteName.room:
        return getRoute(RoomScreen(hotelId: args as String));
      case RouteName.checkOut:
        return getRoute(CheckOutScreen(room: args as Room));
      default:
        return getRoute(const SplashScreen());
    }
  }
}
