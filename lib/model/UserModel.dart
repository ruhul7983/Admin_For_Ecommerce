class UserModel {
  UserModel({
    required this.name,
    required this.email,
    required this.uid,
    required this.imageUrl,
    required this.phone,
    required this.gender,
  });
  late final String name;
  late final String email;
  late final String uid;
  late final String imageUrl;
  late final String phone;
  late final String gender;

  UserModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    uid = json['uid'];
    imageUrl = json['imageUrl'];
    phone = json['phone'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['uid'] = uid;
    data['imageUrl'] = imageUrl;
    data['phone'] = phone;
    data['gender'] = gender;
    return data;
  }
}

class AddressModel {
  AddressModel({
    required this.name,
    required this.uid,
    required this.phone,
    required this.upazila,
    required this.district,
    required this.division,
    required this.location,
  });
  late final String name;
  late final String uid;
  late final String phone;
  late final String upazila;
  late final String district;
  late final String division;
  late final String location;

  AddressModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    uid = json['uid'];
    phone = json['phone'];
    upazila = json['upazila'];
    district = json['district'];
    division = json['division'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['uid'] = uid;
    data['phone'] = phone;
    data['upazila'] = upazila;
    data['district'] = district;
    data['division'] = division;
    data['location'] = location;
    return data;
  }
}