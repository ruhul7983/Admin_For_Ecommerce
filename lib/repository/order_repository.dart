import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_admin/model/order_model.dart';

class OrderRepository {
  Stream<List<OrderModel>> fetchOrders() {
    return FirebaseFirestore.instance
        .collection("order")
        .orderBy("orderDate", descending: true)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((docSnapshot) {
        final data = docSnapshot.data();
        return OrderModel.fromJson(data);
      }).toList();
    });
  }

  Future<void> updateOrderStatus(String oId, String updatedStatus) async {
    await FirebaseFirestore.instance.collection("order").doc(oId).update({
      "orderStatus": updatedStatus,
    });
  }
}
