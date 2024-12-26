import 'package:flutter/material.dart';
import 'package:surveyist/UI_for_all/signUp_Ui.dart';
import 'package:surveyist/admin_uI/adminDashboard.dart';
import 'package:surveyist/managerUI/managerDashboard.dart';
import 'package:surveyist/users_UI/userDashboard.dart';

import 'package:surveyist/utils/appButton.dart';
import 'package:surveyist/utils/appConstant.dart';
import 'package:surveyist/utils/appFont.dart';
import 'package:surveyist/utils/appImage.dart';
import 'package:surveyist/utils/appSnackBarOrToastMessage.dart';
import 'package:surveyist/utils/app_Language.dart';

class LoginScreenForAll extends StatefulWidget {
  const LoginScreenForAll({super.key});

  @override
  State<LoginScreenForAll> createState() => _LoginScreenForAllState();
}

class _LoginScreenForAllState extends State<LoginScreenForAll> {
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  loginEmailWithPassword(userEmail, userPassword) {
    int len = userPassword.length;
    if (userEmail == "") {
      ShowTaostMessage.toastMessage(
          context, Applanguage.entterEmailText[Applanguage.language]);
    } else if ((!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(userEmail))) {
      ShowTaostMessage.toastMessage(
          context, Applanguage.NotValidEmail[Applanguage.language]);
    } else if (userPassword == "") {
      ShowTaostMessage.toastMessage(
          context, Applanguage.passwordNameessage[Applanguage.language]);
    } else if (userPassword == "") {
      ShowTaostMessage.toastMessage(
          context, Applanguage.passwordNameessage[Applanguage.language]);
    } else if (len < 6) {
      ShowTaostMessage.toastMessage(
          context, Applanguage.passWordlength[Applanguage.language]);
    } else {
      //there i will use firebase authication functionality.......................
      if (userEmail == "admin1@gmail.com" && userPassword == "123456") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const AdminDashboardPage()));
        ShowTaostMessage.toastMessage(context, "SuccesfullLogin");
      } else if (userEmail == "manager1@gmail.com" &&
          userPassword == "1234567") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ManagerdashboardPage()));
      } else if (userEmail == "user1@gmail.com" && userPassword == "12345678") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>  UserDashBoardScreen()));
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    userEmailController.dispose();
    userPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            //this column for login logo image and login name
            Column(
              children: [
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 30 / 100,
                    width: MediaQuery.of(context).size.width * 50 / 100,
                    // child:Image.asset(Appimage.SplashScreen,fit: BoxFit.fill,),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Appimage.SplashScreen),
                            fit: BoxFit.fill),
                        shape: BoxShape.circle),
                  ),
                ),
                Center(
                  child: Text(
                    Applanguage.signIn[Applanguage.language],
                    style: TextStyle(
                        fontFamily: AppFont.fontFamily,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ),
                Container(
                  child: TextField(
                    controller: userEmailController,
                    decoration: InputDecoration(
                        hintText: "Email",

                        // icon:Icon(Icons.person)
                        prefixIcon: Icon(
                          Icons.person,
                          size: 30,
                        )),
                    maxLength: 25,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1 / 100,
                ),
                Container(
                  child: TextField(
                    controller: userPasswordController,
                    decoration: InputDecoration(
                        hintText: "password",

                        // icon:Icon(Icons.person)
                        prefixIcon: Icon(
                          Icons.person,
                          size: 30,
                        ),
                        suffixIcon: Icon(Icons.password_sharp)),
                    maxLength: 10,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 3 / 100,
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          print("this is forgor password scren will be ");
                        },
                        child: Text("Forgot_password")),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 2 / 100,
                ),
                Container(
                  child: MyButton(
                    text: 'Login',
                    color: const Color.fromARGB(255, 34, 137, 221),
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             const SignUpScreenForAll()));
                      // ShowTaostMessage.toastMessage(context, "SuccesfullLogin");
                      print("heloo");
                      loginEmailWithPassword(
                          userEmailController.text.toString().trim(),
                          userPasswordController.text.toString().trim());
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 4 / 100,
                ),
                Container(
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 4 / 100,
                      ),
                      Container(
                        child: Text("Dont have account yet?"),
                      ),
                      Container(
                        child: TextButton(
                            onPressed: () {
                              print("sigh_up_screen");
                            },
                            child: Text(Applanguage
                                .signupButtonText[Applanguage.language])),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
