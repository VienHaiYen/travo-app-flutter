import 'package:app_cyclone/travo_app_ac/models/guest.dart';
import 'package:app_cyclone/travo_app_ac/models/payment_card_info.dart';

class Booking {
  Booking({
    required this.dateEnd,
    required this.dateStart,
    required this.email,
    required this.guest,
    required this.hotel,
    this.payment_card_info,
    this.promo_code,
    required this.room,
    required this.typePayment,
    required this.userId,
  });

  final DateTime dateEnd;
  final DateTime dateStart;
  final String email;
  final List<Guest> guest;
  final String hotel;
  final PaymentCardInfo? payment_card_info;
  final String? promo_code;
  final String room;
  final String typePayment;
  final String userId;
}
