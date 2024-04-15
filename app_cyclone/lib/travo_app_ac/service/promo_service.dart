import 'package:app_cyclone/travo_app_ac/models/promo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PromoService {
  static Future<Promo?> fetchData(String id) async {
    try {
      final snapshots =
          await FirebaseFirestore.instance.collection('promo').doc(id).get();

      Promo data = Promo.fromFirestore(snapshots);

      // return rooms;
      return data;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
