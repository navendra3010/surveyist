import 'package:flutter/foundation.dart';
import 'package:surveyist/adminModel/allUsersModel.dart';
import 'package:surveyist/adminProvider/fireStoreServiceforAdmin/fireStoreserAdmin.dart';

class CommanproviderAdmin extends ChangeNotifier
{
ViewAllUsers? viewuser;
FireStoreServiceForAdmin frstr=FireStoreServiceForAdmin();

Stream<List<ViewAllUsers>> get allUsersStream {
    return frstr.getAllUsers();
  }




}