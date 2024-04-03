import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class Room {
  Room(
      {required this.hotel,
      required this.id,
      this.typePrice,
      this.image,
      this.name,
      this.services,
      this.maxGuest,
      this.price,
      this.total});

  final String hotel;
  final String id;
  final String? image;
  final int? maxGuest;
  final String? name;
  final int? price;
  final List<String>? services;
  final int? total;
  final String? typePrice;

  factory Room.fromFirestore(DocumentSnapshot doc) {
    String id = doc.reference.id;
    Map data = doc.data() as Map;
    return Room(
      id: id,
      hotel: data['hotel'],
      image: data['image'],
      maxGuest: data['max_guest'],
      name: data['name'],
      price: data['price'],
      services: data['services'].map<String>((e) => e.toString()).toList(),
      total: data['total'],
      typePrice: data['type_price'],
    );
  }
}
