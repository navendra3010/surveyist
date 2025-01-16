import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surveyist/userModel/userProfilemodel.dart';
import 'package:surveyist/userProviders/loginProvider.dart';
import 'package:surveyist/utils/appConstant.dart';
import 'package:surveyist/utils/appFont.dart';
import 'package:surveyist/utils/appFooter.dart';
import 'package:surveyist/utils/appImage.dart';
import 'package:surveyist/utils/footerForUsers.dart';

class UsersprofilePage extends StatefulWidget {
  const UsersprofilePage({super.key});

  @override
  State<UsersprofilePage> createState() => _UsersprofilePageState();
}

class _UsersprofilePageState extends State<UsersprofilePage> {
  

  void _showAlertDialog(BuildContext context, String name) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit/UpDate"),
          content: Text('This is the alert content.'),
          actions: [
            TextField(
              decoration: InputDecoration(
                hintText: name,
              ),
            ),
            Card(
              child: Text(
                "update",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
            )
          ],
        );
      },
    );
  }
  // @override
  // void initState()
  // {
  //   super.initState();
  //     Provider.of<LoginProviderForUser>(context, listen: false)
  //       .getUserprofile();
  //  }

  @override
  Widget build(BuildContext context) {
      final auth = Provider.of<LoginProviderForUser>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 3 / 100,
            ),
            FutureBuilder(
              
              future:auth.getDeviceinfo(), 
            builder: (context, snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting)
              {
                return Center(
                  child:CircularProgressIndicator(),
                );
              }
              if(snapshot.hasError)
              {
                return Center(
                  child:Text("No user profile"),
                );
              }
             
             return Column(
              children: [
//column start---------------------------
Center(
                child: Card(
              child: Text(
                "",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: AppFont.fontFamily,
                    fontWeight: FontWeight.w800),
              ),
                )
                ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 5 / 100,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 6 / 100,
                    width: MediaQuery.of(context).size.width * 20 / 100,
                    // child:Image.asset(Appimage.SplashScreen,fit:BoxFit.fill,),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(Appimage.profileImage),
                          fit: BoxFit.fill,
                        )),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Card(child: Icon(Icons.delete)),
                        Card(
                          child: Icon(Icons.upload),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 5 / 100,
            ),
            Container(
              height: 0.5,
              color: Colors.grey,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 1 / 100,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${''}",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: AppFont.fontFamily,
                              fontWeight: FontWeight.w800),
                        ),
                        Text("jack_charlie")
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showAlertDialog(context, "jack_charlie");
                    },
                    child: Container(
                      child: Card(
                        child: Text("Edit"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 2 / 100,
            ),
            Container(
              height: 0.5,
              color: Colors.grey,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 2 / 100,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: AppFont.fontFamily,
                              fontWeight: FontWeight.w800),
                        ),
                        Text("jack1@gmail.com")
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showAlertDialog(context, "jack1@gmail.com");
                    },
                    child: Container(
                      child: Card(
                        child: Text("Edit"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 2 / 100,
            ),
            Container(
              height: 0.5,
              color: Colors.grey,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 2 / 100,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mobile",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: AppFont.fontFamily,
                              fontWeight: FontWeight.w800),
                        ),
                        Text("7978675900")
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showAlertDialog(context, "7978675900");
                    },
                    child: Container(
                      child: Card(
                        child: Text("Edit"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 2 / 100,
            ),
            Container(
              height: 0.5,
              color: Colors.grey,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 2 / 100,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Address",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: AppFont.fontFamily,
                              fontWeight: FontWeight.w800),
                        ),
                        Text("Bhopal Isbt Road")
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showAlertDialog(context, "Bhopal Isbt Road");
                    },
                    child: Container(
                      child: Card(
                        child: Text("Edit"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 2 / 100,
            ),
            Container(
              height: 0.5,
              color: Colors.grey,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 2 / 100,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Designation",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: AppFont.fontFamily,
                              fontWeight: FontWeight.w800),
                        ),
                        Text("Site Engineer")
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showAlertDialog(context, "site Engineer");
                    },
                    child: Container(
                      child: Card(
                        child: Text("Edit"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 2 / 100,
            ),
            Container(
              height: 0.5,
              color: Colors.grey,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 2 / 100,
            ),
//colomn end here--------------------
              ],
             ) ;
            }
            )

          ],
        
        ),
      ),
      bottomNavigationBar:
          footerUiForUsers(notificationCount: 0, selectMenu2: ButtomMenu2.userprofile),
    );
  }
}
