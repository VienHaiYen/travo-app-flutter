import 'package:app_cyclone/travo_app_ac/models/guest.dart';
import 'package:app_cyclone/travo_app_ac/models/payment_card_info.dart';
import 'package:app_cyclone/travo_app_ac/models/promo.dart';
import 'package:app_cyclone/travo_app_ac/models/seat.dart';

class BookingFlight {
  BookingFlight({
    this.card,
    this.createdAt,
    this.email = "",
    this.flight = "",
    this.guest,
    this.promoCode,
    this.seat,
    this.typePayment = "",
  });

  PaymentCardInfo? card;
  DateTime? createdAt;
  String email;
  String flight;
  Guest? guest;
  Promo? promoCode;
  Seat? seat;
  String typePayment;

  Map<String, dynamic> toMap() {
    return {
      'card': card != null ? card!.toMap() : null,
      'createdAt': createdAt != null ? createdAt!.toIso8601String() : null,
      'email': email,
      'flight': flight,
      'guest': guest != null ? guest!.toMap() : null,
      'promoCode': promoCode?.code ?? "",
      'seat': seat != null ? seat!.toMap() : null,
      'typePayment': typePayment,
    };
  }

  bool isValid() {
    print(
        email.isNotEmpty && flight.isNotEmpty && guest != null && seat != null);
    return email.isNotEmpty &&
        flight.isNotEmpty &&
        guest != null &&
        seat != null;
  }
}
