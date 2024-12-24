import 'package:flutter/material.dart';
import 'package:surveyist/users_UI/taskDetail.dart';
import 'package:surveyist/utils/appConstant.dart';
import 'package:surveyist/utils/appFont.dart';

import 'package:surveyist/utils/appImage.dart';
import 'package:surveyist/utils/app_Language.dart';
import 'package:surveyist/utils/footerForUsers.dart';

class UserDashBoardScreen extends StatelessWidget {
  const UserDashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 3 / 100,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    // height: MediaQuery.of(context).size.height * 5/ 100,
                    //width: MediaQuery.of(context).size.width * 30 / 100,
                    // color:Colors.amberAccent,
                    child: Image.asset(
                      Appimage.Notification,
                      fit: BoxFit.fill,
                      cacheHeight: 25,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 2 / 100,
            ),
            Center(
              child: Container(
                //height: MediaQuery.of(context).size.height * 15 / 100,
                width: MediaQuery.of(context).size.width * 90 / 100,
                //color:Colors.amberAccent,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: const Color.fromARGB(255, 249, 250, 250)),
                child: Column(
                  children: [
                    Text(
                      "Today_Task",
                      style: TextStyle(
                          fontFamily: AppFont.fontFamily,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(Applanguage.todayTask[Applanguage.language],
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontFamily: AppFont.fontFamily,
                            fontSize: 15,
                            color: const Color.fromARGB(255, 117, 119, 117),
                            fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5 / 100,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TaskDetails()));
                        },
                        child: Text("click_here")),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          footerUiForUsers(notificationCount: 0, selectMenu2: ButtomMenu2.userHome),
    );
  }
}
