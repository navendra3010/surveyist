import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:surveyist/adminModel/allUsersModel.dart';
import 'package:surveyist/adminProvider/fireStoreServiceforAdmin/fireStoreserAdmin.dart';
import 'package:surveyist/userModel/userlogin.dart';

class CommanproviderAdmin extends ChangeNotifier {
  ViewAllUsers? viewuser;
  UserLoginModel? userLoginModel;
  FireStoreServiceForAdmin frstr = FireStoreServiceForAdmin();

  Stream<List<ViewAllUsers>> get allUsersStream {
    return frstr.getAllUsers();
  }

  Stream<List<QuerySnapshot<Map<String, dynamic>>>> allLoginUser() {
    
    return frstr.getAllLoginUser();
    
  }
}
