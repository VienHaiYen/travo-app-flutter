import 'package:cloud_firestore/cloud_firestore.dart';

class Flight {
  Flight(
      {this.airline = "",
      required this.id,
      this.arrive_time,
      this.departure_time,
      this.from_place = "",
      this.no = "",
      this.price = 0,
      this.seat,
      this.to_place = ""});

  String? airline;
  String id;
  Timestamp? arrive_time;
  Timestamp? departure_time;
  String? from_place;
  String? no;
  int? price;
  List<dynamic>? seat;
  String? to_place;

  factory Flight.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    String id = doc.reference.id;
    return Flight(
      id: id,
      airline: data['airline'],
      arrive_time: data['arrive_time'],
      departure_time: data['departure_time'],
      from_place: data['from_place'],
      no: data['no'],
      price: data['price'],
      seat: data['seat'],
      to_place: data['to_place'],
      // awayKilometer: data['awayKilometer'],
    );
  }

  static const airlineImg = {
    'LionAir': 'assets/images/lion_air.png',
    'BatikAir': 'assets/images/batik_air.png',
    'Citilink': 'assets/images/citillink.png',
    'Garuna': 'assets/images/garuda.png',
    'AirAsia': 'assets/images/air_asia.png',
  };
}
