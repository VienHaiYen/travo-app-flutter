import 'package:app_cyclone/travo_app_ac/models/room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RoomService {
  static Future<List<Room>> fetchData(String hotelId) async {
    try {
      final snapshots = await FirebaseFirestore.instance
          .collection('room')
          .where("hotel", isEqualTo: hotelId)
          .get();

      List<Room> rooms = snapshots.docs.map((doc) {
        return Room.fromFirestore(doc);
      }).toList();

      // print("ee" + rooms.length.toString());
      return rooms;
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<Room?> getRoomById(String id) async {
    try {
      DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance.collection('room').doc(id).get();
      Room room = Room.fromFirestore(documentSnapshot);
      // print(room.image);
      return room;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
