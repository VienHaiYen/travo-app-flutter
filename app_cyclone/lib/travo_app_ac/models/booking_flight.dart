import 'package:app_cyclone/travo_app_ac/models/guest.dart';
import 'package:app_cyclone/travo_app_ac/models/payment_card_info.dart';
import 'package:app_cyclone/travo_app_ac/models/promo.dart';
import 'package:app_cyclone/travo_app_ac/models/seat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  factory BookingFlight.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return BookingFlight(
      seat: Seat.fromJson(data['seat'] as Map<String, dynamic>),
      flight: data['flight'],
      typePayment: data['typePayment'],
      createdAt: data['createdAt'] != null
          ? (data['createdAt'] as Timestamp).toDate()
          : null,
    );
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
