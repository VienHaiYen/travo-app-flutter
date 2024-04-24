import 'package:app_cyclone/travo_app_ac/models/guest.dart';
import 'package:app_cyclone/travo_app_ac/models/payment_card_info.dart';
import 'package:app_cyclone/travo_app_ac/models/promo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Booking {
  Booking({
    this.date_end,
    this.date_start,
    this.email = "",
    this.guest = const [],
    this.hotel = "",
    this.payment_card_info,
    this.promo_code,
    this.room = "",
    this.typePayment = "",
    this.userId = "",
    this.created_at,
  });

  final DateTime? date_end;
  final DateTime? date_start;
  final String email;
  final List<Guest>? guest;
  final String hotel;
  final PaymentCardInfo? payment_card_info;
  final Promo? promo_code;
  final String room;
  final String? typePayment;
  final String userId;
  final DateTime? created_at;

  Map<String, dynamic> toMap() {
    print(guest!.length);
    return {
      'date_end': date_end != null ? Timestamp.fromDate(date_end!) : null,
      'date_start': date_start != null ? Timestamp.fromDate(date_start!) : null,
      'email': email,
      'guest': guest != [] ? guest!.map((guest) => guest.toMap()).toList() : [],
      'hotel': hotel,
      'payment_card_info':
          payment_card_info != null ? payment_card_info!.toMap() : null,
      'promo_code': promo_code!.code ?? "",
      'room': room,
      'typePayment': typePayment,
      'userId': userId,
      'created_at': DateTime.now().toIso8601String()
    };
  }

  bool isValid() {
    print("456");
    print(guest!.isNotEmpty);
    print(date_end != null &&
        date_start != null &&
        email.isNotEmpty &&
        // guest?[0] != null &&
        hotel.isNotEmpty &&
        room.isNotEmpty &&
        (typePayment!.isNotEmpty || typePayment != null) &&
        userId.isNotEmpty);
    return date_end != null &&
        date_start != null &&
        email.isNotEmpty &&
        guest!.isNotEmpty &&
        hotel.isNotEmpty &&
        room.isNotEmpty &&
        (typePayment!.isNotEmpty || typePayment != null) &&
        userId.isNotEmpty;
  }

  factory Booking.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    // print(DateTime.parse(data['created_at']));
    return Booking(
      date_end: data['date_end'] != null
          ? (data['date_end'] as Timestamp).toDate()
          : null,
      date_start: data['date_start'] != null
          ? (data['date_start'] as Timestamp).toDate()
          : null,
      hotel: data['hotel'] ?? "",
      room: data['room'] ?? "",
      created_at: data['created_at'] != null
          ? DateTime.parse(data['created_at'])
          : null,
    );
  }
}
