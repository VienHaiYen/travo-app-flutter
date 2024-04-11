import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  Review(
      {this.comment,
      required this.hotel,
      this.photos = const [],
      this.rated_time,
      this.rating = 0,
      this.room = "",
      required this.user});
  final String? comment;
  final String hotel;
  final List<String>? photos;
  final Timestamp? rated_time;
  final double? rating;
  final String? room;
  final String user;

  factory Review.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Review(
        comment: data['comment'],
        hotel: data['hotel'],
        photos: data['photos'].map<String>((e) => e.toString()).toList(),
        rated_time: data['rated_time'],
        rating: data['rating'],
        room: data['room'],
        user: data['user']);
  }
}
