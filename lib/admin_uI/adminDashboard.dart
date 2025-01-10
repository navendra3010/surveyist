import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surveyist/adminProvider/adminHomeProvider.dart';
import 'package:surveyist/adminProvider/adminoperationProvider.dart';

import 'package:surveyist/admin_uI/usersDetails.dart';
import 'package:surveyist/utils/TextSyle.dart';

import 'package:surveyist/utils/appConstant.dart';
import 'package:surveyist/utils/appFooter.dart';
import 'package:surveyist/utils/appSnackBarOrToastMessage.dart';

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  @override
  void initState() {
    super.initState();
   // Provider.of<AllOpeationAndUpdate>(context, listen: false).fetchAllLoginRecords();
  }

  @override
  Widget build(BuildContext context) {
    final providerHome= Provider.of<Adminhomeprovider>(context);
     final loginUpdateProvider= Provider.of<AllOpeationAndUpdate>(context,listen: false);
    //  var loginDocs=adminHomeProvider.todaysLogins;
    var   user_iddoc=providerHome.userIdLists;

    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 2 / 100,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 25 / 100,
                  width: MediaQuery.of(context).size.width * 100 / 100,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 228, 153, 41),
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 3 / 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildBoxContainer(
                              context, "A", ViewUserDetailsOnlyadmin()),
                          buildBoxContainer(context, "B"),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 3 / 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildBoxContainer(context, "C"),
                          buildBoxContainer(context, "D")
                        ],
                      ),
                    ],
                  ),
                ),
                //decoration box container end here...................................................
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1 / 100,
                ),
                Container(
                  child: Text(
                    "All_Active users",
                    style: CustomText.nameOfTextStyle,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1 / 100,
                ),
                // FutureBuilder(future:loginUpdateProvider.fetchAllLoginRecords(),
                
                //  builder: (context, snapshot) {
                //   if (snapshot.connectionState == ConnectionState.waiting) {
                //     return Center(
                //       child: CircularProgressIndicator(),
                //     );
                //   }
                //   if (snapshot.hasError) {
                //     return Center(
                //       child: Text("no login record"),
                //     );
                //   }
                //    final record = loginUpdateProvider;
                //    if(record.isEmpty)
                //    {
                //     return Center(child:Text("no login found yet"),);
                //    }
                //   return Expanded(
                //     child: ListView.builder(
                //       itemCount: record.length,
                //       itemBuilder: (context, index) {
                //         final us = record[index];
                //         return Container(
                //           height: MediaQuery.of(context).size.height * 15 / 100,
                //           width: MediaQuery.of(context).size.width * 9 / 100,
                //           child: Card(
                //             child: Column(
                //               children: [
                //                 Text("user_Login_Date:-${us.loginDate ?? 'no name'}"),
                //                 Text("user_Time:-${us.loginTime ?? 'no name'}"),
                //                // Text("${user['created_at'] ?? 'no name'}"),
                //                 Text("user_address:-${us.address?? 'no name'}"),
                //                 Text("user_: ${us.latitude ?? 'no name'}"),
                //                   Text("user_: ${us.longitude ?? 'no name'}"),
                //                     Text("user_: ${us.model?? 'no name'}"),
                //                       Text("user_: ${us.deviceBrand ?? 'no name'}"),
                //                        Text("user_: ${us.board?? 'no name'}"),
                //                         Text("user_: ${us. device?? 'no name'}"),
                //                          Text("user_: ${us.deviceId ?? 'no name'}"),
                            


                                
                //               ],
                //             ),
                //           ),
                //         );
                //       },
                //     ),
                //     );
                    
                
                // },
                //)
               
        

              ])),
      bottomNavigationBar:
          AppFooterUi(notificationCount: 0, selectMenu: ButtomMenu.home),
    );
  }

  void navigateToScreen(BuildContext context, Widget? destination) {
    if (destination != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => destination),
      );
    } else {
      // Optional: Show a snackbar or log a message if no destination
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No destination set for this button.')),
      );
    }
  }

  Widget buildBoxContainer(BuildContext context, text, [Widget? designation]) {
    return TextButton(
      onPressed: () {
        navigateToScreen(context, designation);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 7 / 100,
        width: MediaQuery.of(context).size.width * 30 / 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Center(
          child: Text(
            text,
            style: CustomText.nameOfTextStyle,
          ),
        ),
      ),
    );
  }
}
