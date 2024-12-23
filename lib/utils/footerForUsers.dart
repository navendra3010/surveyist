import 'package:flutter/material.dart';
import 'package:surveyist/admin_uI/adminDashboard.dart';
import 'package:surveyist/admin_uI/adminProfile.dart';
import 'package:surveyist/admin_uI/createProject.dart';
import 'package:surveyist/admin_uI/viewAllUser.dart';
import 'package:surveyist/users_UI/userDashboard.dart';
import 'package:surveyist/utils/appConstant.dart';
import 'package:surveyist/utils/appImage.dart';

class footerUiForUsers extends StatelessWidget {
  const footerUiForUsers(
      {required this.notificationCount, required this.selectMenu, super.key});

  final ButtomMenu2 selectMenu;
  final int? notificationCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 7 / 100,
      // width: MediaQuery.of(context).size.width*100/100,
      width: double.infinity,
      decoration:BoxDecoration(
         border:Border.all(width:1,color:Colors.grey),
         borderRadius:BorderRadius.circular(20),
        color:Colors.white
      ),
     // color: const Color.fromARGB(255, 78, 78, 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              if (ButtomMenu2.home != selectMenu)

              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserDashBoardScreen()));
            },
            child: Container(child: Icon(Icons.home,color:ButtomMenu.home!=selectMenu?Colors.black:Colors.grey)),
          ),
          InkWell(
            onTap: () {
              // if (ButtomMenu2.camera!= selectMenu)
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) => viewAllUserpage()
                    
                //     )
                //     );
            },
            child: Container(child: Icon(Icons.person,color:ButtomMenu.users!=selectMenu?Colors.black:Colors.grey)),
          ),
          InkWell(
            onTap: () {
              // if (ButtomMenu2.submitTask != selectMenu)
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => CreateProjectPage()));
            },
            child: Container(child: Icon(Icons.create,color:ButtomMenu.createProject!=selectMenu?Colors.black:Colors.grey)),
          ),
          InkWell(
            onTap: () {
              // if (ButtomMenu2.profile != selectMenu)
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => AdminProfilePage()));
            },
            child: Container(child: Icon(Icons.circle,color:ButtomMenu.profile!=selectMenu?Colors.black:Colors.grey)),
          ),
        ],
      ),
    );
  }
}
