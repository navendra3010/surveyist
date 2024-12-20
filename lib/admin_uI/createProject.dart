


import 'package:flutter/material.dart';
import 'package:surveyist/utils/appConstant.dart';
import 'package:surveyist/utils/appFooter.dart';

class CreateProjectPage extends StatelessWidget {
  const CreateProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body: Center(
        child:Text("create project page"),
      ),
       bottomNavigationBar:AppFooterUi(notificationCount: 0, selectMenu:ButtomMenu.createProject),
    );
  }
}