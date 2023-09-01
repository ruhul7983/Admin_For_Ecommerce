import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_admin/model/ProductModel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class SliderRepository {
  Stream<List<SliderModel>> fetchSlider() {
    return FirebaseFirestore.instance
        .collection("carousel")
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((docSnapshot) {
        final data = docSnapshot.data();
        return SliderModel.fromJson(data);
      }).toList();
    });
  }

  Future<void> deleteSlider(String docId) async {
    await FirebaseFirestore.instance.collection("carousel").doc(docId).delete();
  }

  String docId = Uuid().v1();
  Future<void> postSlider(String campaignName, File imageUrl) async {
    Reference storageRef =
        FirebaseStorage.instance.ref().child("slider_image").child(docId);
    UploadTask uploadTask = storageRef.putFile(imageUrl);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();

    SliderModel sliderModel = SliderModel(
        campaignName: campaignName, imageUrl: downloadUrl, docId: docId);
    await FirebaseFirestore.instance
        .collection("carousel")
        .doc(docId)
        .set(sliderModel.toJson());
  }
}
