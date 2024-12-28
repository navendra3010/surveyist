import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:surveyist/repositry/firebaseAuthentication.dart';
import 'package:surveyist/users_UI/userDashboard.dart';
import 'package:surveyist/utils/appSnackBarOrToastMessage.dart';
import 'package:surveyist/utils/app_Language.dart';

class LoginProviderForUser extends ChangeNotifier {
  bool isloading = false;

  Future<void> userLoginAuthantication(BuildContext context, email, String password) async {
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
    } else if (password == "") {
      ShowTaostMessage.toastMessage(
          context, Applanguage.passwordNameessage[Applanguage.language]);
    } else if (len < 6) {
      ShowTaostMessage.toastMessage(
          context, Applanguage.passWordlength[Applanguage.language]);
    } else {
      isloading=true;
      notifyListeners();
      
      FirebaseauthenticationStatus.auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        ShowTaostMessage.toastMessage(context, "Login sucessfully");
        isloading=true;
        notifyListeners();
        Navigator.push(context, MaterialPageRoute(builder: (context) =>UserDashBoardScreen()));
      });
    }
  }
}
