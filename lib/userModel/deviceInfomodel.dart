import 'package:cloud_firestore/cloud_firestore.dart';

class Deviceinformation {
  String? deviceId;
  String? deviceBrand;
  String? device;
  String? model;
  String? board;

  Deviceinformation(
      {this.deviceBrand, this.model, this.board, this.device, this.deviceId});

  Map<String, dynamic> toFireStore() {
    return {
      "device": device as String,
      "device_Id": deviceId as String,
      "device_brand": deviceBrand as String,
      "board": board as String,
      "model": model as String,
    };
  }

   factory Deviceinformation.fromFireStore(DocumentSnapshot doc)
   {

     Map<String,dynamic>data=doc.data() as Map<String, dynamic>;
     return Deviceinformation(

      device:data['device'],
      deviceBrand: data['device_brand'],
      deviceId: data['device_Id'],
      model: data['model'],
      board: data['board'],

     );
   }
    String toString() {
    return "Board: $board, device_Id: $deviceId, Device: $device, Model: $model, Brand: $deviceBrand";
  }
}
