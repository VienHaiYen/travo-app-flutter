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

  static Future<List<Hotel>> searchData(String str) async {
    try {
      final snapshots =
          await FirebaseFirestore.instance.collection('hotel').get();

      List<Hotel> hotels = snapshots.docs.map((doc) {
        // Map<String, dynamic> data = doc.data();
        return Hotel.fromFirestore(doc);
      }).toList();

      return hotels
          .where((element) =>
              element.name!.toLowerCase().contains(str.toLowerCase()))
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<Hotel?> getHotelById(String id) async {
    try {
      DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance.collection('hotel').doc(id).get();
      // print(documentSnapshot.data());
      Hotel hotel = Hotel.fromFirestore(documentSnapshot);
      // print(hotel.name);
      return hotel;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
