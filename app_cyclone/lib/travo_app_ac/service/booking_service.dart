import 'package:cloud_firestore/cloud_firestore.dart';

class BookingService {
  static Future<String> addDataToFirestore(Map<String, dynamic> data) async {
    try {
      // Khởi tạo một instance của Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Thêm dữ liệu vào collection 'data'
      var a = await firestore.collection('booking').add(data);
      print(a);

      print('Dữ liệu đã được thêm thành công vào Firestore!');
      return "Success";
    } catch (e) {
      print('Lỗi khi thêm dữ liệu vào Firestore: $e');
      return "Error";
    }
  }
}
