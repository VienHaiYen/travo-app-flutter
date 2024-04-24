import 'package:app_cyclone/travo_app_ac/enums/sort.dart';
import 'package:app_cyclone/travo_app_ac/models/flight.dart';
import 'package:app_cyclone/travo_app_ac/models/search_flight.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderBy {
  OrderBy({required this.field, this.descending = false});
  String field;
  bool descending;
}

class FlightService {
  static Future<List<Flight>> fetchData(
      SearchFlight search, Sort orderBy, RangeValues priceRange) async {
    try {
      DateTime startDate = DateTime(
          search.date.year, search.date.month, search.date.day, 0, 0, 0);
      DateTime endDate = DateTime(
          search.date.year, search.date.month, search.date.day, 23, 59, 59);

      // ORDER BY
      void convertToOrder(Sort sort, List<Flight> flights) {
        switch (sort) {
          case Sort.Earliest_Departure:
            flights
                .sort((a, b) => a.departure_time!.compareTo(b.departure_time!));
            break;
          case Sort.Latest_Departure:
            flights
                .sort((a, b) => b.departure_time!.compareTo(a.departure_time!));
            break;
          case Sort.Earliest_Arrive:
            flights.sort((a, b) => a.arrive_time!.compareTo(b.arrive_time!));
            break;
          case Sort.Latest_Arrive:
            flights.sort((a, b) => b.arrive_time!.compareTo(a.arrive_time!));
            break;
          case Sort.Shortest_Duration:
            flights.sort((a, b) => (a.arrive_time!.millisecondsSinceEpoch -
                    a.departure_time!.millisecondsSinceEpoch)
                .compareTo(b.arrive_time!.millisecondsSinceEpoch -
                    b.departure_time!.millisecondsSinceEpoch));
            break;
          case Sort.Lowest_Price:
            flights.sort((a, b) => a.price!.compareTo(b.price!));
            break;
          default:
            flights
                .sort((a, b) => a.departure_time!.compareTo(b.departure_time!));
        }
      }

      void filterPriceRange(RangeValues ranges, List<Flight> flights) {
        flights.removeWhere((flight) =>
            flight.price! < ranges.start || flight.price! > ranges.end);
      }

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
      filterPriceRange(priceRange, flights);
      convertToOrder(orderBy, flights);

      return flights;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
