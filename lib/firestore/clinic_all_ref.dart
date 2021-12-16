// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petz_care/model/city_model.dart';
import 'package:petz_care/model/clinic_model.dart';

Future<List<ClinicModel>> getClinics() async {
  var clinics = new List<ClinicModel>.empty(growable: true);
  QuerySnapshot qn = await FirebaseFirestore.instance.collection('clinicAll').get();
  var clinicsRef = FirebaseFirestore.instance.collection('ClinicAll');
  var snapshot = await clinicsRef.get();
  snapshot.docs.forEach((element) {
    clinics.add(ClinicModel.fromJson(element.data()));
  });
  return clinics;
}

Future<List<ClinicModel>> getClinicsDetail() async {
  var clinics = new List<ClinicModel>.empty(growable: true);
  // DocumentReference clinicsRef = FirebaseFirestore.instance.collection('ClinicAll').doc('id').get() as DocumentReference<Object?>;
  var clinicsRef = FirebaseFirestore.instance.collection('ClinicAll').doc('id');
  var snapshot = await clinicsRef.get();
  // snapshot.docs.forEach((element) {
  //   clinics.add(ClinicModel.fromJson(element.data()));
  // });
  return clinics;
}

Future<DocumentSnapshot<Object?>> getDetail(String id) async{
DocumentReference docRef = FirebaseFirestore.instance.collection('ClinicAll').doc("id").get() as DocumentReference<Object?>;
return docRef.get();
}

// Future<List<ClinicModel>> getdoc() async {
//   var clinics = new List<ClinicModel>.empty(growable: true);
//   CollectionReference data1 = FirebaseFirestore.instance.collection('ClinicAll').doc('psaps').get() as CollectionReference<Object?>;
//
//   var clinicsRef = FirebaseFirestore.instance.collection('ClinicAll');
//   var snapshot = await data1.get();
//   snapshot.docs.forEach((element) {
//     clinics.add(ClinicModel.fromJson(element.data()));
//   });
//   return clinics;
// }

 