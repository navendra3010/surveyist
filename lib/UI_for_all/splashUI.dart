import 'package:flutter/material.dart';
import 'package:surveyist/UI_for_all/loginUI.dart';
import 'package:surveyist/admin_uI/adminDashboard.dart';
import 'package:surveyist/users_UI/userDashboard.dart';
import 'package:surveyist/utils/appImage.dart';
import 'package:surveyist/utils/app_Language.dart';
import 'package:surveyist/utils/footerForUsers.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState()
  {
    super. initState();
    Future.delayed(Duration(seconds:3),() => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const   UserDashBoardScreen())));
        //LoginScreenForAll
        // AdminDashboardPage
        //  UserDashBoardScreen
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Center(
        child:Container(
          height: MediaQuery.of(context).size.height*100/100,
          width: MediaQuery.of(context).size.width*100/100,
          child:Image.asset(Appimage.SplashScreen,fit:BoxFit.fill,),
          
          
        ),
      ),
     

      
    );
  }
}