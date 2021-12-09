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
