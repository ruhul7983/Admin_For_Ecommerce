import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_admin/views/add_product.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../model/ProductModel.dart';

class ProductRepository {
  Stream<List<ProductModel>> fetchProducts() {
    return FirebaseFirestore.instance
        .collection("products")
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((docSnapshot) {
        final data = docSnapshot.data();
        return ProductModel.fromJson(data);
      }).toList();
    });
  }

  Future<void> deleteProduct(String productId) async {
    await FirebaseFirestore.instance
        .collection("products")
        .doc(productId)
        .collection("ratting")
        .doc()
        .delete();
    await FirebaseFirestore.instance
        .collection("products")
        .doc(productId)
        .delete();
  }

  Future<void> updatePrice(String productId, String updatePrice) async {
    await FirebaseFirestore.instance
        .collection("products")
        .doc(productId)
        .update({
      "price": updatePrice,
    });
  }

  Future<void> postProduct(
    List<String> imageList,
    String name,
    bool codAvailable,
    String brandName,
    List<TextEditingController> size,
    String originalPrice,
    String price,
    String description,
    String categories,
    String stock,
    String returnPolicy,
    String deliveryCharge,
    String postType,
  ) async {
    //first need to upload into firebase storage and get list of download url
    try {
      String productId = Uuid().v1();
      List<String> downloadUrls = [];
      for (String imagePath in imageList) {
        File imageFile = File(imagePath);
        Reference storageRef = FirebaseStorage.instance
            .ref()
            .child("product_image")
            .child("$productId/${Uuid().v4()}");
        UploadTask uploadTask = storageRef.putFile(imageFile);
        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
        String downloadUrl = await taskSnapshot.ref.getDownloadURL();
        downloadUrls.add(downloadUrl);

        ProductModel productModel = ProductModel(
            codAvailable: codAvailable,
            deliveryCharge: deliveryCharge,
            brandName: brandName,
            size: size.map((controller) => controller.text).toList(),
            originalPrice: originalPrice,
            price: price,
            name: name,
            sellCount: "0",
            description: description,
            categories: categories,
            stock: stock,
            productId: productId,
            returnPolicy: returnPolicy,
            postType: postType,
            image: downloadUrls);
        //then upload to firebase storage
        await FirebaseFirestore.instance
            .collection("products")
            .doc(productId)
            .set(productModel.toJson());
      }
    } catch (err) {
      print(err.toString());
    }
  }
}
