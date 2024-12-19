import 'package:flutter/material.dart';

class UserDashBoardScreen extends StatelessWidget {
  const UserDashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(title:Text("userDashboard"),),
      body:Center(
        child:Text("user dashboard screen"),
      ),
    );
  }
}