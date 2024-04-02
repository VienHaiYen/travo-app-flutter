import 'package:cloud_firestore/cloud_firestore.dart';

class Place {
  // String id;
  String image;
  String name;
  double rating;

  Place({required this.image, required this.name, required this.rating});

  factory Place.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Place(
      image: data['image'],
      name: data['name'],
      rating: data['rating'],
    );
  }
}
