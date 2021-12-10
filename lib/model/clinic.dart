// To parse this JSON data, do
//
//     final clinics = clinicsFromJson(jsonString);

import 'dart:convert';

Clinics clinicsFromJson(String str) => Clinics.fromJson(json.decode(str));

String clinicsToJson(Clinics data) => json.encode(data.toJson());

class Clinics {
  Clinics({
    required this.clinics,
  });

  List<Clinic> clinics;

  factory Clinics.fromJson(Map<String, dynamic> json) => Clinics(
        clinics:
            List<Clinic>.from(json["clinics"].map((x) => Clinic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "clinics": List<dynamic>.from(clinics.map((x) => x.toJson())),
      };
}

class Clinic {
  Clinic({
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
    required this.maps,
  });

  String id;
  String name;
  String address;
  String pictureId;
  String city;
  String telp;
  double rating;
  String workingHours;
  String service;
  String price;
  String fullAddress;
  String maps;

  factory Clinic.fromJson(Map<String, dynamic> json) => Clinic(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        pictureId: json["pictureId"],
        city: json["city"],
        telp: json["telp"],
        rating: json["rating"].toDouble(),
        workingHours: json["workingHours"],
        service: json["service"],
        price: json["price"],
        fullAddress: json["fullAddress"],
        maps: json["maps"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "pictureId": pictureId,
        "city": city,
        "telp": telp,
        "rating": rating,
        "workingHours": workingHours,
        "service": service,
        "price": price,
        "fullAddress": fullAddress,
        "maps": maps,
      };
}
