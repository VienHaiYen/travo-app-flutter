import 'package:app_cyclone/travo_app_ac/models/booking.dart';
import 'package:app_cyclone/travo_app_ac/models/booking_flight.dart';
import 'package:app_cyclone/travo_app_ac/models/flight.dart';
import 'package:app_cyclone/travo_app_ac/models/user_info.dart';

class BookingFlightInfoState {
  final BookingFlight currentBooking;
  final Flight flight;

  UserInfo_ empty = UserInfo_();
  BookingFlightInfoState({required this.currentBooking, required this.flight});

  factory BookingFlightInfoState.init() {
    return BookingFlightInfoState(
        currentBooking: BookingFlight(), flight: Flight(id: ""));
  }
}
