import 'package:cloud_firestore/cloud_firestore.dart';

class AccountInfo {
  AccountInfo(
      {required this.avatar,
      required this.country,
      required this.email,
      required this.name,
      required this.phone});
  final String avatar;
  final String country;
  final String email;
  final String name;
  final String phone;

  factory AccountInfo.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return AccountInfo(
      avatar: data['avatar'],
      country: data['country'],
      email: data['email'],
      name: data['name'],
      phone: data['phone'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'avatar': avatar,
      'country': country,
      'email': email,
      'name': name,
      'phone': phone,
    };
  }
}
