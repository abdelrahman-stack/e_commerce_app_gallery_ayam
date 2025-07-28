
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DatabaseService {
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId});
  Future<dynamic> getData({
    required String path,
    String? docuementId,
    Map<String, dynamic>? query,
  });

  Future<bool> checkIfDataExists(
      {required String path, required String docuementId});
      Future<QuerySnapshot<Map<String, dynamic>>> getUserOrders(String uId) async {
  return await FirebaseFirestore.instance
      .collection('orders')
      .where('uId', isEqualTo: uId)
      .get();
}


  
}