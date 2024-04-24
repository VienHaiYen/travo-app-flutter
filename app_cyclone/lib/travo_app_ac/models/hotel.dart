import 'package:cloud_firestore/cloud_firestore.dart';

class Hotel {
  String id;
  String? image;
  String? information;
  String? location;
  String? locationDescription;
  String? name;
  int? price;
  double? rating;
  int? totalReview;

  // String? awayKilometer;

  Hotel(
      {required this.id,
      this.image,
      this.information,
      this.location,
      this.locationDescription,
      this.name,
      this.price,
      this.totalReview,
      // this.awayKilometer,
      this.rating});

  factory Hotel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    String id = doc.reference.id;
    return Hotel(
      id: id,
      image: data['image'],
      information: data['information'],
      location: data['location'],
      locationDescription: data['location_description'],
      name: data['name'],
      price: data['price'],
      totalReview: data['total_review'],
      rating: data['rating'],
    );
  }
}
