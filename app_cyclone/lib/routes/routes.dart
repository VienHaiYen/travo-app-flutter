import 'package:app_cyclone/routes/route_name.dart';
import 'package:app_cyclone/travo_app_ac/layouts/bottom_navigation_layout/bottom_navigation_layout.dart';
import 'package:app_cyclone/travo_app_ac/models/flight.dart';
import 'package:app_cyclone/travo_app_ac/models/hotel.dart';
import 'package:app_cyclone/travo_app_ac/models/room.dart';
import 'package:app_cyclone/travo_app_ac/models/search_flight.dart';
import 'package:app_cyclone/travo_app_ac/screens/add_card_screen/add_card_screen.dart';
import 'package:app_cyclone/travo_app_ac/screens/add_passenger/add_passenger.dart';
import 'package:app_cyclone/travo_app_ac/screens/authen_screen/forgot_password.dart';
import 'package:app_cyclone/travo_app_ac/screens/authen_screen/login_screen.dart';
import 'package:app_cyclone/travo_app_ac/screens/authen_screen/signup_screen.dart';
import 'package:app_cyclone/travo_app_ac/screens/booking_check_out/screen_2.dart';
import 'package:app_cyclone/travo_app_ac/screens/booking_check_out/check_out_screen.dart';
import 'package:app_cyclone/travo_app_ac/screens/booking_check_out/screen_1.dart';
import 'package:app_cyclone/travo_app_ac/screens/booking_check_out/screen_3.dart';
import 'package:app_cyclone/travo_app_ac/screens/contact_details_screen/contact_details_screen.dart';
import 'package:app_cyclone/travo_app_ac/screens/detail_hotel_screen/detail_hotel_screen.dart';
import 'package:app_cyclone/travo_app_ac/screens/facilities/facilities.dart';
import 'package:app_cyclone/travo_app_ac/screens/flight_check_out/check_out_screen.dart';
import 'package:app_cyclone/travo_app_ac/screens/flight_check_out/screen_1.dart';
import 'package:app_cyclone/travo_app_ac/screens/flight_check_out/screen_2.dart';
import 'package:app_cyclone/travo_app_ac/screens/flight_check_out/screen_3.dart';
import 'package:app_cyclone/travo_app_ac/screens/flight_screen/flight_screen.dart';
import 'package:app_cyclone/travo_app_ac/screens/hotel_screen/hotel_screen.dart';
import 'package:app_cyclone/travo_app_ac/screens/onboarding_screen/onboarding_carousel.dart';
import 'package:app_cyclone/travo_app_ac/screens/promo_code_screen/promo_code_screen.dart';
import 'package:app_cyclone/travo_app_ac/screens/review_screen/review_screen.dart';
import 'package:app_cyclone/travo_app_ac/screens/room_screen/room_screen.dart';
import 'package:app_cyclone/travo_app_ac/screens/sort_by/sort_by.dart';
import 'package:app_cyclone/travo_app_ac/screens/splash_screen/splash__screen.dart';
import 'package:app_cyclone/travo_app_ac/screens/ticket_screen/ticket_screen.dart';
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
      case RouteName.contactDetails:
        return getRoute(const ContactDetailsScreen());
      case RouteName.promoCode:
        return getRoute(const PromoCodeScreen());
      case RouteName.checkOut:
        return getRoute(CheckOutScreen(
          room: args as Room,
        ));
      case RouteName.addCard:
        return getRoute(AddCardScreen());
      case RouteName.addPassenger:
        return getRoute(AddPassengerScreen());
      case RouteName.review:
        return getRoute(ReviewScreen(hotelId: args as String));
      case RouteName.flightDetail:
        return getRoute(FlightScreen());
      case RouteName.ticket:
        return getRoute(TicketScreen(
          searchData: args as SearchFlight,
        ));
      case RouteName.flightCheckout:
        return getRoute(FlightCheckOutScreen(
          flight: args as Flight,
        ));

      case RouteName.facilities:
        return getRoute(Facilities());
      case RouteName.sortBy:
        return getRoute(SortBy());
      default:
        return getRoute(const SplashScreen());
    }
  }
}
