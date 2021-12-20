import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petz_care/model/city.dart';

class QueryController {
  FirebaseFirestore? firestore;
  final City city;
  QueryController({
    required this.city,
  });

  init() {
    firestore = FirebaseFirestore.instance;
  }

  Future<List> filterCLinic() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await firestore!
          .collection('ClinicAll')
          .where("city", isEqualTo: "${city.name}")
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {
            "id": doc.id,
            "name": doc['name'],
            "address": doc['address'],
            "fullAddress": doc['fullAddress'],
            "city": doc['city'],
            "pictureId": doc['pictureId'],
            "rating": doc['rating'],
            "price": doc['price'],
            "service": doc['service'],
            "telp": doc['telp'],
            "workingHours": doc['workingHours'],
            "maps": doc['maps']
          };
          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
    return docs;
  }
}
