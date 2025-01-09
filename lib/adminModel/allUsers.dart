import 'package:cloud_firestore/cloud_firestore.dart';

class ViewAllUsers
{


  String? email;
  String? id;
  String? role;
  String? password;
   DateTime? createdAt;
  ViewAllUsers({this.email,this.createdAt,this.role,this.id,this.password});


  Map<String,dynamic>toJson()
  {
    return {
           "email":email,
           "role":role,
           "id":id,
           "createdAt":createdAt,
           "password":password
    };
  }
  factory ViewAllUsers.Fromjson(DocumentSnapshot<Map<String,dynamic>>snapshot,
  SnapshotOptions? options,){
    final data=snapshot.data();
    return ViewAllUsers(
      email: data?['email'],
      role: data?['role'],
      id:data?['data'],
      password: data?['password'],
      createdAt: data?['createdAt'],
    );
  }
}