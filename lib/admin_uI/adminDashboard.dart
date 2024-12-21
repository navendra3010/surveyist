import 'package:flutter/material.dart';
import 'package:surveyist/utils/appConstant.dart';
import 'package:surveyist/utils/appFooter.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body:Center(
        child:Text("admin panel"),
      ),
      bottomNavigationBar:AppFooterUi(notificationCount: 0, selectMenu:ButtomMenu.home),
    );
  }
}



