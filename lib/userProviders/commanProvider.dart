import 'package:flutter/foundation.dart';
import 'package:surveyist/fireStoreServiceForUser.dart/firestoreServiceUser.dart';
import 'package:surveyist/userModel/deviceInfomodel.dart';
import 'package:surveyist/userModel/deviceLocatioModel.dart';
import 'package:surveyist/userModel/userProfilemodel.dart';
import 'package:surveyist/userModel/userlogin.dart';

class CommanProviderForUser extends ChangeNotifier {
  FireStoreSerivcesForUser fires = FireStoreSerivcesForUser();
  String? userID;
   bool isLogOut=false;

  Userprofilemodel? userProfile;
//get user unique id----------------------------
  void getUserId(id) {
    userID = id;
    notifyListeners();
    print("--------------get user id-${userID}--------------------------");
  }

  ///fatch user prfile using provider
  Future<Userprofilemodel?> getUserInfo() async {
    if (userID != null) {
      return await fires.getUserProfile(userID!);
    } else {
      print("User ID is null");
    }
//String? setId=userID;
  }
      Future<void> getLogoutprovider()async{
        await fires.logout(userID);
        print(userID);
        notifyListeners();

}
//user log_Out.......
Future<void> logout()async
{
fires.logOutService(userID);
isLogOut=true;
notifyListeners();
}

}
