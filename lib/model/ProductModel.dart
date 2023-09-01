class ProductModel {
  final bool codAvailable;
  final String brandName;
  final List<String> size;
  final String originalPrice;
  final String price;
  final String name;
  final String sellCount;
  final String description;
  final String categories;
  final String stock;
  final String returnPolicy;
  final String deliveryCharge;
  final String productId;
  final String postType;
  final List<String> image;

  ProductModel({
    required this.codAvailable,
    required this.deliveryCharge,
    required this.brandName,
    required this.size,
    required this.originalPrice,
    required this.price,
    required this.name,
    required this.sellCount,
    required this.description,
    required this.categories,
    required this.stock,
    required this.productId,
    required this.returnPolicy,
    required this.image,
    required this.postType,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      codAvailable: json['codAvailable'] ?? false,
      brandName: json['brandName'] ?? '',
      size: List<String>.from(json['size'] ?? []),
      originalPrice: json['originalPrice'] ?? "",
      price: json['price'] ?? "",
      name: json['name'] ?? '',
      sellCount: json['sellCount'] ?? "0",
      description: json['description'] ?? '',
      categories: json['categories'] ?? '',
      productId: json['productId'] ?? '',
      deliveryCharge: json['deliveryCharge'] ?? '',
      stock: json['stock'] ?? "0",
      postType: json['stpostTypeock'] ?? "hotSelling",
      returnPolicy: json['returnPolicy'] ?? 'Return is not possible',
      image: List<String>.from(json['image'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'codAvailable': codAvailable,
      'deliveryCharge': deliveryCharge,
      'brandName': brandName,
      'size': size,
      'originalPrice': originalPrice,
      'price': price,
      'name': name,
      'sellCount': sellCount,
      'description': description,
      'categories': categories,
      'stock': stock,
      'productId': productId,
      'returnPolicy': returnPolicy,
      'image': image,
      'postType': postType,
    };
  }
}

class SliderModel {
  final String campaignName;
  final String imageUrl;
  final String docId;

  SliderModel({
    required this.campaignName,
    required this.imageUrl,
    required this.docId,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      campaignName: json['campaignName'],
      imageUrl: json['imageUrl'],
      docId: json['docId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'campaignName': campaignName,
      'imageUrl': imageUrl,
      'docId': docId,
    };
  }
}
