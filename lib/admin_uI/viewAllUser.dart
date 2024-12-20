import 'package:flutter/material.dart';
import 'package:surveyist/utils/appConstant.dart';
import 'package:surveyist/utils/appFont.dart';
import 'package:surveyist/utils/appFooter.dart';

class viewAllUserpage extends StatelessWidget {
  const viewAllUserpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 5 / 100,
            ),
            Center(
              child: Text(
                "All_users",
                style: TextStyle(
                    fontFamily: AppFont.fontFamily,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 2 / 100,
            ),
            Center(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "search users......",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height * 2 / 100,
            ),
           
              
            
          ],
        ),
      ),
      bottomNavigationBar:
          AppFooterUi(notificationCount: 0, selectMenu: ButtomMenu.users),
    );
  }
}
