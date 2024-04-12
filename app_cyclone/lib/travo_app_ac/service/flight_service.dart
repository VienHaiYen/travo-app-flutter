import 'package:app_cyclone/travo_app_ac/models/flight.dart';
import 'package:app_cyclone/travo_app_ac/models/search_flight.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FlightService {
  static Future<List<Flight>> fetchData(SearchFlight search) async {
    try {
      DateTime startDate = DateTime(
          search.date.year, search.date.month, search.date.day, 0, 0, 0);
      DateTime endDate = DateTime(
          search.date.year, search.date.month, search.date.day, 23, 59, 59);

      final snapshots = await FirebaseFirestore.instance
          .collection('flight')
          .where("from_place", isEqualTo: search.from)
          .where("to_place", isEqualTo: search.to)
          .where("departure_time",
              isGreaterThanOrEqualTo: Timestamp.fromDate(startDate))
          .where('departure_time', isLessThanOrEqualTo: endDate)
          .get();

      List<Flight> flights = snapshots.docs.map((doc) {
        return Flight.fromFirestore(doc);
      }).toList();

      // print("ee" + flights.length.toString());
      return flights;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
