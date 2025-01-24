import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surveyist/adminProvider/adminHomeProvider.dart';
import 'package:surveyist/adminProvider/adminoperationProvider.dart';
import 'package:surveyist/adminProvider/commanproviderforAdmin.dart';
import 'package:surveyist/admin_uI/createNewUsersUi.dart';
import 'package:surveyist/userModel/userlogin.dart';

import 'package:surveyist/utils/TextSyle.dart';

import 'package:surveyist/utils/appConstant.dart';
import 'package:surveyist/utils/appFooter.dart';

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  @override
  void initState() {
    super.initState();
    // Provider.of<Adminhomeprovider>(context, listen: false)
    //     .fetchAllLoginDetails();
  }

  @override
  Widget build(BuildContext context) {
    final providerHome = Provider.of<Adminhomeprovider>(context);
    final loginUpdateProvider =
        Provider.of<AllOpeationAndUpdate>(context, listen: false);
    final commanproviderAdmin = Provider.of<CommanproviderAdmin>(context);

    var user_iddoc = providerHome.loginRecordList;

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
                      buildBoxContainer(context, "new_users", CreateNewUs()),
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
                "Active users",
                style: CustomText.nameOfTextStyle,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 1 / 100,
            ),

            StreamBuilder<List<QuerySnapshot<Map<String, dynamic>>>>(
                stream: commanproviderAdmin.allLoginUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                      child: Text("no user Found"),
                    );
                  }
                  var users = snapshot.data!
                      .expand((QuerySnapshot) => QuerySnapshot.docs)
                      .toList();
                  if (users.isEmpty) {
                    return Center(
                      child: Text(("no login found yet")),
                    );
                  }
                  // final userIdd=users.keys.toList();

                  return Expanded(
                    child: ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final data = users[index].data();
                        final login_time = data['login_time'] ?? 'no data';
                        List<dynamic> loc = data["location"] ?? [];
                        String add = loc[0]["address"];
                        String addtrim = add.substring(5, 20);
                       
                        return Container(
                          height: MediaQuery.of(context).size.height * 7 / 100,
                          width: MediaQuery.of(context).size.width * 9 / 100,
                          decoration: BoxDecoration(

                              // color: Colors.amber

                              ),
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(
                                        "Name:----${data['full_name']}",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(
                                        "Id--${data['employeId']}",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                                //  Text("employeId:-${data['employeId']}"),
                                //   Text("Login_time:-${data['Login_time']}"),
                                //   Text("Login_time:-${data['Login_status']}"),
                                //    //Text("Login_time:-${data['location']}"),
                                //   Text(add),

                                //Text(users[index].id)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    //starting-----------------------
                                    Column(
                                      children: [
                                        Text(
                                          "Login_Time",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "${data["Login_time"]}",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    //ending---------------------------
                                    Column(
                                      children: [
                                        Text(
                                          "Location",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "${addtrim}",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Working_hour",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "${data["Login_time"]}",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Card(
                                      color: data["Login_status"]==true?Colors.green:Colors.red,
                                      child: Column(
                                        children: [
                                          Text(
                                            "LogOut_Time",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "${data["Login_time"]}",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),

//------------------------ending login details fatch
          ],
        ),
      ),
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

//this is for basically starting container--------------------------
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
  //ending----------------------------
}
