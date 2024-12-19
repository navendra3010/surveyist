import 'package:flutter/material.dart';
import 'package:surveyist/UI_for_all/signUp_Ui.dart';
import 'package:surveyist/utils/appButton.dart';
import 'package:surveyist/utils/appFont.dart';
import 'package:surveyist/utils/appImage.dart';
import 'package:surveyist/utils/app_Language.dart';

class LoginScreenForAll extends StatefulWidget {
  const LoginScreenForAll({super.key});

  @override
  State<LoginScreenForAll> createState() => _LoginScreenForAllState();
}

class _LoginScreenForAllState extends State<LoginScreenForAll> {
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
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
                  height: MediaQuery.of(context).size.height * 7 / 100,
                ),
                Container(
                  child: MyButton(
                    text: 'Login',
                    color: const Color.fromARGB(255, 34, 137, 221),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SignUpScreenForAll()));
                                  print("helo");
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
