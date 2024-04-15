import 'package:cloud_firestore/cloud_firestore.dart';

class Promo {
  final String? code;
  final String? endow;
  final String? image;
  final double? price;

  Promo({this.code = "", this.endow = "", this.image = "", this.price = 0});

  factory Promo.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Promo(
      code: data['code'],
      endow: data['endow'],
      image: data['image'],
      price: data['price'],
    );
  }
}
