import 'package:app_cyclone/travo_app_ac/models/guest.dart';
import 'package:app_cyclone/travo_app_ac/models/payment_card_info.dart';
import 'package:app_cyclone/travo_app_ac/models/room.dart';

abstract class BookingInfoEvent {}

class UpdateBookingInfoEvent extends BookingInfoEvent {
  final DateTime? date_end;
  final DateTime? date_start;
  final String email;
  final List<Guest>? guest;
  final String hotel;
  final PaymentCardInfo? payment_card_info;
  final String? promo_code;
  final String room;
  final String? typePayment;
  final String userId;

  UpdateBookingInfoEvent({
    this.date_end,
    this.date_start,
    this.email = "",
    this.guest = const [],
    this.hotel = "",
    this.payment_card_info,
    this.promo_code = "",
    this.room = "",
    this.typePayment = "",
    this.userId = "",
  });
}

class UpdateRoomEvent extends BookingInfoEvent {
  final Room room;

  UpdateRoomEvent({required this.room});
}
