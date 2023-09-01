import 'package:e_commerce_admin/model/UserModel.dart';
import 'package:e_commerce_admin/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/order_model.dart';

final userProvider = StreamProvider<List<UserModel>>((ref) {
  return AuthRepository()
      .fetchUsers(); // Assuming you've defined the fetchProducts function as mentioned earlier
});
