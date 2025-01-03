import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:surveyist/UI_for_all/loginUI.dart';
import 'package:surveyist/repositry/firebaseAuthentication.dart';
import 'package:surveyist/utils/appSnackBarOrToastMessage.dart';
import 'package:surveyist/utils/app_Language.dart';

class Sighupprovider extends ChangeNotifier {
  bool? isloading = false;
  String message = "";

  Future<void> sighupAthuntication(
      String email, String password, context) async {
    int len = password.length;
    if (email == "") {
      ShowTaostMessage.toastMessage(
          context, Applanguage.nullMessage[Applanguage.language]);
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
      try {
        await FirebaseauthenticationStatus.auth
            .createUserWithEmailAndPassword(email: email, password: password).then((value){

              isloading = true;
        notifyListeners();
        ShowTaostMessage.toastMessage(context, "Succesfully Account created");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreenForAll()),
        );
            });
        
      } on FirebaseAuthException catch (e) {
        print("FirebaseAuthException: ${e.code}");
        String message;

        if (e.code == 'user-not-found') {
          message = 'No user found with this email.';
        } else if (e.code == 'wrong-password') {
          message = 'Incorrect password. Please try again.';
        } else if (e.code == 'invalid-email') {
          message = 'The email address is not valid.';
        } else {
          message = 'this email already exits.';
        }

        isloading = false;
        notifyListeners();
        ShowTaostMessage.toastMessage(context, message);
      } on PlatformException catch (e) {
        String message;

        if (e.code == 'invalid-credential') {
          message = 'Invalid credentials. Please check your details.';
        } else {
          message = 'Platform error. Please try again.';
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
