

import 'package:flutter/material.dart';
import 'package:surveyist/utils/appButton.dart';
import 'package:surveyist/utils/appFont.dart';
import 'package:surveyist/utils/appImage.dart';

import '../utils/app_Language.dart';

class SignUpScreenForAll extends StatefulWidget {
  const SignUpScreenForAll({super.key});

  @override
  State<SignUpScreenForAll> createState() => _SignScreenForAllState();
}

class _SignScreenForAllState extends State<SignUpScreenForAll> {
  TextEditingController userEmailSignController = TextEditingController();
  TextEditingController userPasswordSignController = TextEditingController();
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
                    Applanguage.signUP[Applanguage.language],
                    style: TextStyle(
                        fontFamily: AppFont.fontFamily,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ),
                Container(
                  child: TextField(
                    controller: userEmailSignController,
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
                    controller: userPasswordSignController,
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
                    text: 'Sign_Up',
                    color: const Color.fromARGB(255, 34, 137, 221),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 4 / 100,
                ),
                
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
