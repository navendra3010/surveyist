import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surveyist/adminProvider/adminHomeProvider.dart';

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
    Provider.of<Adminhomeprovider>(context, listen: false).getAllUserIds();
  }

  @override
  Widget build(BuildContext context) {
    final providerHome= Provider.of<Adminhomeprovider>(context);
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
                //  adminHomeProvider.isLoginRecord?Center(
                //   child: CircularProgressIndicator()):loginDocs.isEmpty?Center( child: Text("no_loign_today")):ListView.builder(
                //     itemCount: loginDocs.length,

                //     itemBuilder: (context, index) {
                //       var login=loginDocs[index].data() as Map<String,dynamic>;

                //     return Card(
                //        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                //        child:ListTile(
                //         title: Text("Time:${login['Login_time']??'N/A'}"),
                //         subtitle:Text("Login device${login["model"]??"unknow"}"),
                //        ),

                //     );
                //   },)
                Expanded(child:Consumer<Adminhomeprovider>(builder:(context, value, child) {
                  if(providerHome.isLoginRecord)
                  {
                    return Center(child: CircularProgressIndicator(),);
                  }
                  if(providerHome.userIdLists.isEmpty)
                  {
                    return Center(child:Text("no list found"),);
                  }
                  return ListView.builder(
                    itemCount: user_iddoc.length,
                    itemBuilder: (context, index) {
                    return Container(
                      child:Text(providerHome.userIdLists[index]),
                    );
                  },);
                },) )


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
