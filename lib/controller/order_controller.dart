import 'package:e_commerce_admin/model/order_model.dart';
import 'package:e_commerce_admin/repository/order_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderProvider = StreamProvider<List<OrderModel>>((ref) {
  return OrderRepository().fetchOrders(); // Assuming you've defined the fetchProducts function as mentioned earlier
});