import 'package:app_cyclone/travo_app_ac/models/booking.dart';
import 'package:app_cyclone/travo_app_ac/models/room.dart';
import 'package:app_cyclone/travo_app_ac/models/user_info.dart';

class BookingInfoState {
  final Booking currentBooking;
  final Room room;

  UserInfo_ empty = UserInfo_();
  BookingInfoState({required this.currentBooking, required this.room});

  factory BookingInfoState.init() {
    return BookingInfoState(
        currentBooking: Booking(), room: Room(hotel: "", id: ""));
  }
}
