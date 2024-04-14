import 'package:app_cyclone/travo_app_ac/models/account_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountService {
  static void addDataToFirestore(Map<String, dynamic> data) async {
    try {
      print("received data");
      // Khởi tạo một instance của Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Thêm dữ liệu vào collection 'data'
      DocumentReference<Map<String, dynamic>> info =
          await firestore.collection('user').add(data);

      print(info);

      print('Dữ liệu đã được thêm thành công vào Firestore!');
    } catch (e) {
      print('Lỗi khi thêm dữ liệu vào Firestore: $e');
    }
  }

  static Future<AccountInfo?> fetchData(email) async {
    print("789");
    try {
      final snapshots = await FirebaseFirestore.instance
          .collection('user')
          .where('email', isEqualTo: email)
          .get();
      List<AccountInfo> accounts = snapshots.docs.map((doc) {
        return AccountInfo.fromFirestore(doc);
      }).toList();

      AccountInfo account = accounts[0];
      print(account.toMap());

      return account;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
