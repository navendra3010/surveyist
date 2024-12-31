import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:surveyist/localization/deviceInformation.dart';
import 'package:surveyist/repositry/firebaseAuthentication.dart';
import 'package:surveyist/users_UI/userDashboard.dart';
import 'package:surveyist/utils/appSnackBarOrToastMessage.dart';
import 'package:surveyist/utils/app_Language.dart';
import 'package:surveyist/utils/dateFormates.dart';

class LoginProviderForUser extends ChangeNotifier {
  bool isloading = false;

  Future<void> userLoginAuthantication(
      BuildContext context, email, String password) async {
    int len = password.length;

    if (email == "") {
      ShowTaostMessage.toastMessage(
          context, Applanguage.entterEmailText[Applanguage.language]);
    } else if ((!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email))) {
      ShowTaostMessage.toastMessage(
          context, Applanguage.NotValidEmail[Applanguage.language]);
    } else if (password == "") {
      ShowTaostMessage.toastMessage(
          context, Applanguage.passwordNameessage[Applanguage.language]);
    } else if (len < 6) {
      ShowTaostMessage.toastMessage(
          context, Applanguage.passWordlength[Applanguage.language]);
    } else {
      isloading = true;
      notifyListeners();

      try {
        UserCredential userCredential = await FirebaseauthenticationStatus.auth
            .signInWithEmailAndPassword(email: email, password: password);

        // Success flow
        ShowTaostMessage.toastMessage(context, "Login successfully");
        isloading = true;
        notifyListeners();
       
         DateFormate.currentDateAndTime();
        // DeviceInfo.LoginDeviceInfo();
         // Map<String, dynamic> getDeviceData=DeviceInfo.loginDeviceInfo();
           
         //  DeviceInfo.loginDeviceInfo();

      
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserDashBoardScreen()),
        );
      } on FirebaseAuthException catch (e) {
        print("FirebaseAuthException: ${e.code}");
        String message;

        switch (e.code) {
          case 'invalid-credential':
            message = 'Invalid email or password. Please try again.';
            break;
          case 'user-not-found':
            message = 'No user found for this email.';
            break;
          case 'wrong-password':
            message = 'Incorrect password. Please try again.';
            break;
          case 'invalid-email':
            message = 'The email format is incorrect.';
            break;
          case 'user-disabled':
            message = 'This user account has been disabled.';
            break;
          default:
            message = 'Authentication failed. Please try again later.';
        }

        isloading = false;
        notifyListeners();
        ShowTaostMessage.toastMessage(context, message);
      } catch (e) {
        print("Unknown error: $e");
        isloading = false;
        notifyListeners();
        ShowTaostMessage.toastMessage(
          context,
          'An unexpected error occurred. Please try again.',
        );
      }
    }
  }
}
