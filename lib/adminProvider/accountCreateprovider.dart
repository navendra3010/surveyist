import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:surveyist/adminModel/createUserAccount.dart';
import 'package:surveyist/admin_uI/adminDashboard.dart';
import 'package:surveyist/utils/appSnackBarOrToastMessage.dart';
import 'package:surveyist/utils/app_Language.dart';

class Accountcreate extends ChangeNotifier {
  //refreance of collection firebase........................
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool isAccountCreate = false;

  void userNewAccount(UserAccount obj, context) {
    int mobileLen = obj.mobileNumber!.length;
    int loginPass = obj.loginPassword!.length;
    if (obj.fullName == "") {
      ShowTaostMessage.toastMessage(
          context, Applanguage.fullName[Applanguage.language]);
    } else if (obj.dob == "") {
      ShowTaostMessage.toastMessage(
          context, Applanguage.dob[Applanguage.language]);
    } else if (obj.gender == "") {
      ShowTaostMessage.toastMessage(
          context, Applanguage.gender[Applanguage.language]);
    } else if ((!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(obj.email!))) {
      ShowTaostMessage.toastMessage(
          context, Applanguage.NotValidEmail[Applanguage.language]);
    } else if (obj.address == "") {
      ShowTaostMessage.toastMessage(
          context, Applanguage.address[Applanguage.language]);
    } else if (obj.employeId == "") {
      ShowTaostMessage.toastMessage(
          context, Applanguage.employeId[Applanguage.language]);
    } else if (obj.mobileNumber == "") {
      ShowTaostMessage.toastMessage(
          context, Applanguage.mobileNumber[Applanguage.language]);
    } else if (mobileLen <= 9) {
      ShowTaostMessage.toastMessage(
          context, Applanguage.mobileLength[Applanguage.language]);
    } else if ((!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(obj.loginId!))) {
      ShowTaostMessage.toastMessage(
          context, Applanguage.loginIdvalid[Applanguage.language]);
    } else if (obj.loginId == "") {
      ShowTaostMessage.toastMessage(
          context, Applanguage.loginId[Applanguage.language]);
    } else if (obj.loginPassword == "") {
      ShowTaostMessage.toastMessage(
          context, Applanguage.passwordNameessage[Applanguage.language]);
    } else if (loginPass <= 4) {
      ShowTaostMessage.toastMessage(
          context, Applanguage.loginPasswordmsg[Applanguage.language]);
    } else {
      try {
        // _firebaseAuth.signInWithEmailAndPassword(
        //     email: obj.loginId!, password: obj.loginPassword!);
        //  isAccountCreate = false;
        //  notifyListeners();
         ShowTaostMessage.toastMessage(context, "Succesfully_Account_Created");
         Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AdminDashboardPage()),
            );
        // String userCurrrentID = _firebaseAuth.currentUser!.uid;
        // if (userCurrrentID != null) {
        //   UserAccount obj2 = UserAccount();
          
        //   createUserOnfireStore(userCurrrentID,context);
        // }
      
        // isAccountCreate=false;
        // notifyListeners();
        print("--------------------------hello--------------------------------");
        print(obj.toFireStore());
      } on PlatformException catch (e) {
        String message;

        if (e.code == 'invalid-credential') {
          message = 'Invalid credentials. Please check your details.';
        } else {
          message = 'Platform error. Please try again.';
        }

        isAccountCreate = false;
        notifyListeners();
        ShowTaostMessage.toastMessage(context, message);
      } catch (e) {
        print("Unknown error: $e");
        isAccountCreate = false;
        notifyListeners();
        ShowTaostMessage.toastMessage(
          context,
          'Account already created to this email. Please change Email address.',
        );
      }
    }
  }

  void createUserOnfireStore() {
    // try {
    //   final addData = _firestore.collection("users").doc(userCurrrentID);
    //   addData.set(UserAccount().toFireStore());
    // } catch (e) {
    //     print("Unknown error: $e");
    //    isAccountCreate = false;
    //     notifyListeners();
    //     ShowTaostMessage.toastMessage(
    //       context,
    //       'Account already created to this email. Please change Email address.',
    //     );
    // }
    //UserAccount us=UserAccount();
    
  }
}
