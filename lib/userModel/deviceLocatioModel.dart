

import 'package:cloud_firestore/cloud_firestore.dart';

class Devicelocation {
  String? address;
  double? latitude;
  double? longitude;
  Devicelocation({this.address, this.latitude, this.longitude});

  Map<String, dynamic> toFireStore() {
    return {
      "address": address,
      "longitude": longitude,
      "latitude": latitude,
    };
  }

  factory Devicelocation.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Devicelocation(
      address: data["address"] as String?,
      latitude: data["latitude"] as double?,
      longitude: data["longitude"] as double?,
    );
  }
   @override
  String toString() {
    return "Address: $address, Latitude: $latitude, Longitude: $longitude";
  }
}
