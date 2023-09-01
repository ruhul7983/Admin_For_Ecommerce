import 'package:e_commerce_admin/model/ProductModel.dart';
import 'package:e_commerce_admin/repository/slider_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sliderProvider = StreamProvider<List<SliderModel>>((ref) {
  return SliderRepository()
      .fetchSlider(); // Assuming you've defined the fetchProducts function as mentioned earlier
});
