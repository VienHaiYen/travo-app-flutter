import 'package:app_cyclone/travo_app_ac/models/guest.dart';
import 'package:app_cyclone/travo_app_ac/models/payment_card_info.dart';
import 'package:app_cyclone/travo_app_ac/models/seat.dart';

class BookingFlight {
  BookingFlight({
    this.card,
    this.created_at,
    this.email = "",
    this.flight = "",
    this.guest,
    this.promoCode,
    this.seat,
    this.typePayment = "",
  });

  PaymentCardInfo? card;
  DateTime? created_at;
  String email;
  String flight;
  Guest? guest;
  String? promoCode;
  Seat? seat;
  String typePayment;
}
