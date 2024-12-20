import 'package:flutter/material.dart';
import 'package:surveyist/utils/appFont.dart';
import 'package:surveyist/utils/appImage.dart';

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
                  height: MediaQuery.of(context).size.height * 2 / 100,
                ),
              Container(
                child: Row( mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      // height: MediaQuery.of(context).size.height * 5/ 100,
                    //width: MediaQuery.of(context).size.width * 30 / 100,
                   // color:Colors.amberAccent,
                     child:Image.asset(Appimage.Notification,fit: BoxFit.fill,cacheHeight:45, ),
                    ),
                  ],
                ),
              ),
               SizedBox(
                  height: MediaQuery.of(context).size.height * 2 / 100,
                ),
                Center(
                  child:Container(
                      height: MediaQuery.of(context).size.height * 15/ 100,
                    width: MediaQuery.of(context).size.width * 90 / 100,
                   //color:Colors.amberAccent,
                   decoration:BoxDecoration(
                    border:Border.all(width:0.5),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color:const Color.fromARGB(255, 249, 250, 250)
                   ),
                   child: Column(
                    children: [
                      Text("Today_Task",style:TextStyle(fontFamily:AppFont.fontFamily,fontSize: 25,fontWeight:FontWeight.w600),)
                    ],
                   ),
                   
                  ),
                ),

            ],
          ),
        ));
  }
}
