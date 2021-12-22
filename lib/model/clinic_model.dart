class ClinicModel {
  late String id;
  late String name;
  late String address;
  late String pictureId;
  late String city;
  late String telp;
  late double rating;
  late String workingHours;
  late String service;
  late String price;
  late String fullAddress;

  ClinicModel({
    required this.id,
    required this.name,
    required this.address,
    required this.pictureId,
    required this.city,
    required this.telp,
    required this.rating,
    required this.workingHours,
    required this.service,
    required this.price,
    required this.fullAddress,

  });

  ClinicModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    address = json["address"];
    pictureId =  json["pictureId"];
    city = json["city"];
    telp = json["telp"];
    rating = json["rating"].toDouble();
    workingHours = json["workingHours"];
    service = json["service"];
    price = json["price"];
    fullAddress = json["fullAddress"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['pictureId'] = this.pictureId;
    data['city'] = this.city;
    data['telp'] = this.telp;
    data['rating'] = this.rating.toDouble;
    data['workingHours'] = this.workingHours;
    data['service'] = this.service;
    data['price'] = this.price;
    data['fullAddress'] = this.fullAddress;


    return data;
  }
}