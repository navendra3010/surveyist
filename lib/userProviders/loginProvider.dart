// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:surveyist/admin_uI/adminDashboard.dart';
import 'package:surveyist/controller/fireStoreCollection.dart';
import 'package:surveyist/localization/deviceInformation.dart';
import 'package:surveyist/repositry/firebaseAuthentication.dart';
import 'package:surveyist/users_UI/userDashboard.dart';
import 'package:surveyist/utils/appSnackBarOrToastMessage.dart';
import 'package:surveyist/utils/app_Language.dart';
import 'package:surveyist/utils/dateFormates.dart';
import 'package:intl/intl.dart';

class LoginProviderForUser extends ChangeNotifier {
  bool isloading = false;

  String? currentUserId;
  String? id;
  String? device;
  String? model;
  String? brand;
  String? board;
   

  Future<void> userLoginAuthantication(
      BuildContext context, email, String password) async {
        
    int len = password.length;

    if (email.isEmpty || password.isEmpty) {
      ShowTaostMessage.toastMessage(
          context, Applanguage.entterEmailText[Applanguage.language]);
      return;
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
        // Check if the user exists before attempting sign-in
        // var methods = await FirebaseauthenticationStatus.auth
        //     .fetchSignInMethodsForEmail(email);

        // if (methods.isEmpty) {
        //   isloading = false;
        //   notifyListeners();
        //   ShowTaostMessage.toastMessage(
        //       context, "No user found with this email.");
        //   return;
        // }

        // Proceed with sign-in if user exists
        await FirebaseauthenticationStatus.auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          currentUserId = FirebaseauthenticationStatus.auth.currentUser?.uid;

          //  print("user login id is ${userID}");
        });
        DeviceInfo deviceInfo = await DeviceInfo.loginDeviceInfo();
        board = deviceInfo.brand;
        id=deviceInfo.id;
      device=deviceInfo.device;
     model=deviceInfo.model;
     brand=deviceInfo.brand;
    
     
    DateTime now=DateTime.now();
     String formattedDate = DateFormat('dd/MM/yyyy hh:mm:ss a').format(now);
    String dateKey = DateFormat('dd-MM-yyyy').format(now);  // Date as key

   //print("the date and time${now}");
   CollectionData.sendUserLoginActivity(currentUserId,formattedDate,dateKey,model,brand,device,id,board);
      
     

       

        // Success flow
        ShowTaostMessage.toastMessage(context, "Login successful");
        isloading = false; // Reset loading after successful login
        notifyListeners();

       
        // notifyListeners();
        
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserDashBoardScreen()),
        );
      } on FirebaseAuthException catch (e) {
        print("FirebaseAuthException: ${e.code}");
        String message;

        switch (e.code) {
          case 'invalid-credential':
          case 'wrong-password':
          case 'invalid-email':
            message = 'Invalid email or password. Please try again.';
            break;
          case 'user-not-found':
            message = 'No account found. Would you like to sign up?';
            break;
          case 'too-many-requests':
            message = 'Too many failed attempts. Try again later.';
            break;
          case 'user-disabled':
            message = 'This account has been disabled.';
            break;
          default:
            message = 'Login failed. Please check your details.';
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

//n (PlatformException(ERROR_INVALID_CREDENTIAL, The supplied auth credential is incorrect, malformed or has expired.
