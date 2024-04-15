import 'package:cloud_firestore/cloud_firestore.dart';

class BookingFlightService {
  static Future<String> addDataToFirestore(Map<String, dynamic> data) async {
    try {
      print("received data");
      // Khởi tạo một instance của Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Thêm dữ liệu vào collection 'data'
      var a = await firestore.collection('booking_flight').add(data);
      print(a);
      print('Dữ liệu đã được thêm thành công vào Firestore!');
      return 'Success';
    } catch (e) {
      print('Lỗi khi thêm dữ liệu vào Firestore: $e');
      return 'Error';
    }
  }
}
