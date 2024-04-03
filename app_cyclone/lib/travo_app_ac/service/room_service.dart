import 'package:app_cyclone/travo_app_ac/models/room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RoomService {
  static Future<List<Room>> fetchData(String hotelId) async {
    print("roomee " + hotelId);
    try {
      final snapshots = await FirebaseFirestore.instance
          .collection('room')
          .where("hotel", isEqualTo: hotelId)
          .get();

      List<Room> rooms = snapshots.docs.map((doc) {
        return Room.fromFirestore(doc);
      }).toList();

      print("ee" + rooms.length.toString());
      return rooms;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
