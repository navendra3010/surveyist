import 'package:flutter/material.dart';
import 'package:surveyist/admin_uI/usersDetails.dart';
import 'package:surveyist/utils/appConstant.dart';
import 'package:surveyist/utils/appFont.dart';
import 'package:surveyist/utils/appFooter.dart';
import 'package:surveyist/utils/appImage.dart';

class viewAllUserpage extends StatelessWidget {
  viewAllUserpage({super.key});
  var usersName = [
    "sse1@gmail.com",
    "sse2@gmail.com",
    "sse3@gmail.com",
    "sse4@gmail.com",
    "sse5@gmail.com",
    "sse6@gmail.com",
    "sse7@gmail.com",
    "sse8@gmail.com",
    "sse9@gmail.com",
    "sse1@gmail.com",
    "sse2@gmail.com",
    "sse3@gmail.com",
    "sse4@gmail.com",
    "sse5@gmail.com",
    "sse6@gmail.com",
    "sse7@gmail.com",
    "sse8@gmail.com",
    "sse9@gmail.com",
    "sse1@gmail.com",
    "sse2@gmail.com",
    "sse3@gmail.com",
    "sse4@gmail.com",
    "sse5@gmail.com",
    "sse6@gmail.com",
    "sse7@gmail.com",
    "sse8@gmail.com",
    "sse9@gmail.com",
  ];
  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("users Managment"),
          content: Text('This is the alert content.'),
          actions: <Widget>[
            Container(
              child:Row( 
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    color:Colors.black,
                    child:Text("Delete_user",style:TextStyle(color:Colors.white,fontWeight:FontWeight.w600),),
                  ),
                   GestureDetector(onTap:() {
                    
                     Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewUserDetailsOnlyadmin()));
                   },
                     child: Card(
                      color:Colors.black,
                      child:Text("User_Details",style:TextStyle(color:Colors.white,fontWeight:FontWeight.w600)),
                                       ),
                   ),
                ],
              ),
            )
          ]
        );
      },
    );
  }

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
              child: Card(
                color: Colors.black,
                child: Text(
                  "All_users......",
                  style: TextStyle(
                      fontFamily: AppFont.fontFamily,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white),
                ),
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
            Expanded(
              child: Container(
                  child: ListView.builder(
                itemCount: usersName.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 7 / 100,
                    width: MediaQuery.of(context).size.width * 9 / 100,
                    child: Card(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(usersName[index]),
                        ),
                        TextButton(
                          onPressed: () {
                            print("hello users");
                            _showAlertDialog(context);
                          },
                          child: Container(
                            child: Image.asset(
                              Appimage.threeDot,
                              fit: BoxFit.fill,
                              cacheHeight: 25,
                            ),
                          ),
                        ),
                      ],
                    )),
                  );
                },
              )),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          AppFooterUi(notificationCount: 0, selectMenu: ButtomMenu.users),
    );
  }
}
