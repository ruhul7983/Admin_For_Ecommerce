
class CartModel {
  String pName;
  String imageUrl;
  String size;
  String oPrice;
  String price;
  String dPercentage;
  String pId;
  String uid;
  String cartId;
  String quantity;
  String cartPrice;

  CartModel({
    required this.pName,
    required this.imageUrl,
    required this.size,
    required this.cartId,
    required this.oPrice,
    required this.price,
    required this.dPercentage,
    required this.pId,
    required this.uid,
    required this.quantity,
    required this.cartPrice,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      pName: json['pName'],
      imageUrl: json['imageUrl'],
      size: json['size'],
      oPrice: json['oPrice'],
      uid: json['uid'],
      price: json['price'],
      dPercentage: json['dPercentage'],
      pId: json['pId'],
      cartId: json['cartId'],
      quantity: json['quantity'],
      cartPrice: json['cartPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pName': pName,
      'imageUrl': imageUrl,
      'size': size,
      'oPrice': oPrice,
      'price': price,
      'dPercentage': dPercentage,
      'pId': pId,
      'uid': uid,
      'cartId': cartId,
      'quantity': quantity,
      'cartPrice': cartPrice,
    };
  }
}




