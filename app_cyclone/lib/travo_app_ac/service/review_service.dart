import 'package:app_cyclone/travo_app_ac/models/review.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewService {
  static Future<List<Review>> fetchData(String hotelId) async {
    try {
      final snapshots = await FirebaseFirestore.instance
          .collection('rating')
          .where("hotel", isEqualTo: hotelId)
          .get();

      List<Review> reviews = snapshots.docs.map((doc) {
        return Review.fromFirestore(doc);
      }).toList();

      // print("ee " + reviews.length.toString());
      return reviews;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
