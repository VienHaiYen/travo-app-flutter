import 'package:app_cyclone/travo_app_ac/models/place.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlaceService {
  static Future<List<Place>> fetchData() async {
    try {
      final snapshots =
          await FirebaseFirestore.instance.collection('place').get();
      List<Place> places = snapshots.docs.map((doc) {
        // Map<String, dynamic> data = doc.data();
        return Place.fromFirestore(doc);
      }).toList();

      return places;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
