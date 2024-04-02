import 'package:app_cyclone/travo_app_ac/models/hotel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HotelService {
  static Future<List<Hotel>> fetchData() async {
    try {
      final snapshots =
          await FirebaseFirestore.instance.collection('hotel').get();
      print("snapshots.docs.length" + snapshots.docs.length.toString());
      List<Hotel> hotels = snapshots.docs.map((doc) {
        // Map<String, dynamic> data = doc.data();
        return Hotel.fromFirestore(doc);
      }).toList();

      print("hotels[100].image");
      print(hotels.length);

      return hotels;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
