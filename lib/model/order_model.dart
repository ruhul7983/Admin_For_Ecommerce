import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  String pName;
  String imageUrl;
  String size;
  String price;
  String totalPrice;
  String pId;
  String uid;
  String quantity;
  String oId;
  String uName;
  String uPhone;
  String uLocation;
  String uPs;
  String uDistrict;
  String uDivision;
  String orderStatus;
  String paymentStatus;
  DateTime orderDate;
  OrderModel({
    required this.pName,
    required this.imageUrl,
    required this.size,
    required this.price,
    required this.pId,
    required this.uid,
    required this.quantity,
    required this.oId,
    required this.uName,
    required this.uPhone,
    required this.uLocation,
    required this.uPs,
    required this.uDistrict,
    required this.uDivision,
    required this.totalPrice,
    required this.orderStatus,
    required this.paymentStatus,
    required this.orderDate,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      pName: json['pName'],
      imageUrl: json['imageUrl'],
      size: json['size'],
      uid: json['uid'],
      price: json['price'],
      totalPrice: json['totalPrice'],
      pId: json['pId'],
      quantity: json['quantity'],
      oId: json['oId'],
      uName: json['uName'],
      uPhone: json['uPhone'],
      uLocation: json['uLocation'],
      uPs: json['uPs'],
      uDistrict: json['uDistrict'],
      uDivision: json['uDivision'],
      orderStatus: json['orderStatus'],
      paymentStatus: json['paymentStatus'],
      orderDate: (json['orderDate'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pName': pName,
      'imageUrl': imageUrl,
      'size': size,
      'price': price,
      'totalPrice': totalPrice,
      'pId': pId,
      'uid': uid,
      'quantity': quantity,
      'oId': oId,
      'uName': uName,
      'uPhone': uPhone,
      'uLocation': uLocation,
      'uPs': uPs,
      'uDistrict': uDistrict,
      'uDivision': uDivision,
      'orderStatus': orderStatus,
      'paymentStatus': paymentStatus,
      'orderDate': orderDate,

    };
  }
}
