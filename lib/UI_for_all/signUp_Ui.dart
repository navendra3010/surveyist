import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surveyist/UI_for_all/loginUI.dart';
import 'package:surveyist/providers/sighUpProvider.dart';
import 'package:surveyist/utils/appButton.dart';
import 'package:surveyist/utils/appFont.dart';
import 'package:surveyist/utils/appImage.dart';
import 'package:surveyist/utils/appSnackBarOrToastMessage.dart';

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
      appBar: AppBar(
        title: Text("sigh_in"),
      ),
      body: SingleChildScrollView(
        child: ChangeNotifierProvider<Sighupprovider>(
          create: (context) => Sighupprovider(),
          child: Consumer<Sighupprovider>(builder: (context, Provider, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
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
                      Provider.isloading == true
                          ? CircularProgressIndicator()
                          : Container(
                              child: MyButton(
                                text: "Sigh_up",
                                color: const Color.fromARGB(255, 228, 153, 41),
                                onPressed: () {
                                  Provider.sighupAthuntication(
                                      userEmailSignController.text
                                          .toString()
                                          .trim(),
                                      userPasswordSignController.text
                                          .toString()
                                          .trim(),
                                      context);
                                },
                              ),
                            ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 4 / 100,
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
