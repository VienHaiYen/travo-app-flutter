import 'package:cloud_firestore/cloud_firestore.dart';

class BookingService {
  static void addDataToFirestore(Map<String, dynamic> data) async {
    try {
      // Khởi tạo một instance của Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Thêm dữ liệu vào collection 'data'
      await firestore.collection('booking').add(data);

      print('Dữ liệu đã được thêm thành công vào Firestore!');
    } catch (e) {
      print('Lỗi khi thêm dữ liệu vào Firestore: $e');
    }
  }
}