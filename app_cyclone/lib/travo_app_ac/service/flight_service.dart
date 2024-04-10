import 'package:app_cyclone/travo_app_ac/models/flight.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FlightService {
  static Future<List<Flight>> fetchData() async {
    try {
      final snapshots =
          await FirebaseFirestore.instance.collection('flight').get();

      List<Flight> flights = snapshots.docs.map((doc) {
        return Flight.fromFirestore(doc);
      }).toList();

      print("ee" + flights.length.toString());
      return flights;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
