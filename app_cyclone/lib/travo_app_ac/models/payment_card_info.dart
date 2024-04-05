import 'package:intl/intl.dart';

class PaymentCardInfo {
  PaymentCardInfo(
      {this.cardNumber = "",
      this.country = "",
      this.cvv = "",
      this.exp_date,
      this.name = ""});

  final String? cardNumber;
  final String? country;
  final String? cvv;
  final DateTime? exp_date;
  final String? name;

  Map<String, dynamic> toMap() {
    return {
      'cardNumber': cardNumber,
      'country': country,
      'cvv': cvv,
      'exp_date':
          exp_date != null ? DateFormat('yyyy-MM-dd').format(exp_date!) : null,
      'name': name,
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Name: $name, Country: $country\nCard number: $cardNumber\nExp.Date: ${DateFormat('yyyy-MM-dd').format(exp_date!)}\nCVV: $cvv';
  }
}
