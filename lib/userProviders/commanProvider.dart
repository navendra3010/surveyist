import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surveyist/UI_for_all/loginUI.dart';
import 'package:surveyist/fireStoreServiceForUser.dart/firestoreServiceUser.dart';
import 'package:surveyist/userModel/userProfilemodel.dart';
import 'package:surveyist/users_UI/userDashboard.dart';

class CommanProviderForUser extends ChangeNotifier {
  FireStoreSerivcesForUser fires = FireStoreSerivcesForUser();

  String? userID;
  bool isLogOut = false;
  bool isAutologin = false;
  String? getId;

  Userprofilemodel? userProfile;
//get user unique id----------------------------
  void getUserId(id) {
    userID = id;
    notifyListeners();
    print("--------------get user id-${userID}--------------------------");
  }

  ///fatch user prfile using provider
  Future<Userprofilemodel?> getUserInfo() async {
    SharedPreferences sff = await SharedPreferences.getInstance();
    String? profileID = await sff.getString('userId');
    if (profileID != null) {
     // print("got profile id      ${profileID}");
      return await fires.getUserProfile(profileID);
    } else {
      print("not getting profile id");
    }
    return null;
  }

// autologin...................
  Future<void> autoLogin(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    isAutologin = true;
    notifyListeners();
    SharedPreferences getval = await SharedPreferences.getInstance();
    String? holdValue = getval.getString("userId");
    if (holdValue != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => UserDashBoardScreen(
                    userId: getId,
                  )));
    } else {
      Future.delayed(
          Duration(seconds: 3),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => LoginScreenForAll())));
      isAutologin = false;
      notifyListeners();
    }
    isAutologin = false;
    notifyListeners();
  }

  //logout user per day...........................
  Future<void> userLogOut(context) async {
    // await FirebaseAuth.instance.signOut();

    SharedPreferences sf = await SharedPreferences.getInstance();

    fires.logOutService();
    notifyListeners();

    bool? getvaluefromSf = await sf.remove("userId");
    if (getvaluefromSf == true) {
      print("id has been removed complety");
    } else {
      print("id cannot removed");
    }

    notifyListeners();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreenForAll()));
  }

  /// this function basically  can be user  to check user id exits in shaarred prefrenes or not
  Future<void> checkSharredprerence() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    String? getvalue = sf.getString('userId');
    if (getvalue != null) {
      print(
          " the user id form shrraed preferencses i got it=--------------${getvalue}");
    } else {
      print("not get value=======================");
    }
  }

//show on ui user login time and current time and working hour
  Future<void> showLoginTimeForUser() async {}
}
