import 'package:app_cyclone/travo_app_ac/models/hotel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HotelService {
  static Future<List<Hotel>> fetchData() async {
    try {
      final snapshots =
          await FirebaseFirestore.instance.collection('hotel').get();
      List<Hotel> hotels = snapshots.docs.map((doc) {
        // print(doc.reference.id);
        return Hotel.fromFirestore(doc);
      }).toList();

      return hotels;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
