class PaymentCardInfo {
  PaymentCardInfo(
      {this.cardNumber = "",
      this.country = "",
      this.cvv = "",
      this.exp_date = "",
      this.name = ""});

  final String? cardNumber;
  final String? country;
  final String? cvv;
  final String? exp_date;
  final String? name;
}
