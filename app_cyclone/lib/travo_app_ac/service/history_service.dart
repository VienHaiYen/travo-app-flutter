import 'package:app_cyclone/travo_app_ac/models/booking.dart';
import 'package:app_cyclone/travo_app_ac/models/booking_flight.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryService {
  static Future<List<Booking>> getBookingRoom(String email) async {
    try {
      final snapshots = await FirebaseFirestore.instance
          .collection('booking')
          .where("email", isEqualTo: email)
          .get();
      // print(snapshots.docs.length);
      List<Booking> bookingRoom = snapshots.docs.map((doc) {
        return Booking.fromFirestore(doc);
      }).toList();

      bookingRoom = bookingRoom
          .where((element) => element.hotel != "" && element.created_at != null)
          .toList();

      return bookingRoom;
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<List<BookingFlight>> getBookingFlight(String email) async {
    try {
      final snapshots = await FirebaseFirestore.instance
          .collection('booking_flight')
          .where("email", isEqualTo: email)
          .get();

      // print(snapshots.docs.toString());
      List<BookingFlight> bookingRoom = snapshots.docs.map((doc) {
        return BookingFlight.fromFirestore(doc);
      }).toList();

      bookingRoom.removeWhere((element) => element.createdAt == null);

      return bookingRoom;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
