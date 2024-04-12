import 'package:app_cyclone/travo_app_ac/models/flight.dart';
import 'package:app_cyclone/travo_app_ac/models/guest.dart';
import 'package:app_cyclone/travo_app_ac/models/payment_card_info.dart';
import 'package:app_cyclone/travo_app_ac/models/room.dart';
import 'package:app_cyclone/travo_app_ac/models/seat.dart';

abstract class BookingFlightInfoEvent {}

class UpdateBookingFlightInfoEvent extends BookingFlightInfoEvent {
  PaymentCardInfo? card;
  DateTime? createdAt;
  String email;
  String flight;
  Guest? guest;
  String? promoCode;
  Seat? seat;
  String typePayment;

  UpdateBookingFlightInfoEvent({
    this.card,
    this.createdAt,
    this.email = "",
    this.flight = "",
    this.guest,
    this.promoCode,
    this.seat,
    this.typePayment = "",
  });
}

class UpdateFlightEvent extends BookingFlightInfoEvent {
  final Flight flight;

  UpdateFlightEvent({required this.flight});
}
