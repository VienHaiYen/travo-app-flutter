import 'package:cloud_firestore/cloud_firestore.dart';

class Hotel {
  String? image;
  String? information;
  String? location;
  String? locationDescription;
  String? name;
  double? price;
  double? rating;
  int? totalReview;
  String? awayKilometer;

  Hotel(
      {this.image,
      this.information,
      this.location,
      this.locationDescription,
      this.name,
      this.price,
      this.totalReview,
      this.awayKilometer,
      this.rating});

  factory Hotel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Hotel(
      image: data['image'],
      information: data['information'],
      location: data['location'],
      locationDescription: data['location-description'],
      name: data['name'],
      price: data['price'],
      totalReview: data['total-review'],
      rating: data['rating'],
      awayKilometer: data['awayKilometer'],
    );
  }
}
