import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:surveyist/userModel/deviceLocatioModel.dart';

import 'deviceInfomodel.dart';

class UserLoginModel {
  bool? loginStatus;
  bool? logOutStatus;
  String? loginDate;
  String? loginTime;
  String? logOutDate;
  String? logOutTime;

  List<Devicelocation> location;
  List<Deviceinformation> deviceinfo;

  String? userName;
  String? userEmpId;
  String? role;
  String? uniqueId;

  // List<Deviceinfo>deviceinfo;

  UserLoginModel({
    this.loginDate,
    this.loginTime,
    this.userEmpId,
    this.userName,
    this.role,
    this.uniqueId,
    this.location = const [],
    this.deviceinfo = const [],
  });
  Map<String, dynamic> toFireStore() {
    return {
      "login_date": loginDate,
      "Login_time": loginTime,
      "logOut_date": logOutDate,
      "LogOut_time": logOutTime,
      "Login_status": loginStatus,
      "LogOut_status": logOutStatus,
      "full_name": userName,
      "employeId": userEmpId,
      "role": role,
      "unique_Id": uniqueId,
      "location": location.map((loc) => loc.toFireStore()).toList(),
    "deviceinfo": deviceinfo.map((loc) => loc.toFireStore()).toList(),
    };
  }

  factory UserLoginModel.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserLoginModel(
      loginDate: data?['login_date'],
      loginTime: data?['Login_time'],
      location: data['location'] != null
          ? (data['location'] as List<dynamic>)
              .map((loc) => Devicelocation.fromFireStore(loc as DocumentSnapshot))
              .toList()
          : [],
          deviceinfo: data['deviceinfo']!=null? (data['deviceinfo'] as List<dynamic>).map((loc)=>Deviceinformation.fromFireStore(loc as DocumentSnapshot)).toList():[],
    );
  }
}
