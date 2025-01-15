import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class UserAccount
{


  String? fullName;
  String? dob;
  String? gender;
  String? email;
  String? address;
  
   DateTime? createdAt;


  String? employeId;
  String? mobileNumber;
  String? loginId;
  String? loginPassword;
  UserAccount({this.fullName,this.dob,this.gender,this.email,this.employeId,this.mobileNumber,this.loginId,this.loginPassword,this.address, this. createdAt});


  Map<String,dynamic>toFireStore()
  {
    return {
      "fullName":fullName,
      "dob":dob,
      "gender":gender,
      "email":email,
      "address":address,
      "employeId":employeId,
      "mobileNumber":mobileNumber,
      "loginId":loginId,
      "loginPassword":loginPassword,
    
      "DateTime":FieldValue.serverTimestamp(),

    };
  }
  factory UserAccount.FromFireStore(DocumentSnapshot<Map<String,dynamic>>documentSnapshot)
  {
    return UserAccount(
      fullName:documentSnapshot["fullName"],
      dob: documentSnapshot["dob"],
      gender: documentSnapshot["fullName"],
      email: documentSnapshot["fullName"],
      address: documentSnapshot["fullName"],
      employeId: documentSnapshot["fullName"],
      mobileNumber: documentSnapshot["fullName"],
      loginId:documentSnapshot["fullName"],
      loginPassword: documentSnapshot["fullName"],
    createdAt:(documentSnapshot['created_at'] as Timestamp).toDate(),

    );
  }
  
  
}