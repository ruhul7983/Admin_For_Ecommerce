
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/ProductModel.dart';
import '../repository/product_repository.dart';


/*Fetching Product without post type*/
final productProvider = StreamProvider<List<ProductModel>>((ref) {
  return ProductRepository().fetchProducts(); // Assuming you've defined the fetchProducts function as mentioned earlier
});