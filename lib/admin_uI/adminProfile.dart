


import 'package:flutter/material.dart';
import 'package:surveyist/utils/appConstant.dart';
import 'package:surveyist/utils/appFooter.dart';

class AdminProfilePage extends StatelessWidget {
  const AdminProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Text("admin profile page"),
      ),
       bottomNavigationBar:AppFooterUi(notificationCount: 0, selectMenu:ButtomMenu.profile),
    );
  }
}