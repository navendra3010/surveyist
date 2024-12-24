import 'package:flutter/material.dart';
import 'package:surveyist/utils/appConstant.dart';
import 'package:surveyist/utils/appFont.dart';
import 'package:surveyist/utils/footerForUsers.dart';

class UserWorkHistory extends StatefulWidget {
  UserWorkHistory({super.key});

  @override
  State<UserWorkHistory> createState() => _UserWorkHistoryState();
}

class _UserWorkHistoryState extends State<UserWorkHistory> {
  List<dynamic> worklist = [
    {
      "TaskName": "complete all measurment and submit distance with elecation",
      "TaskAssignDate": "1-12-2024",
      "tasksdueDate": "12-12-2014",
      "TaskSubmitDate": "12-12-2014",
      "taskStatus": "Pending",
    },
    {
      "TaskName": "submit safe date with pdf",
      "TaskAssignDate": "1-12-2024",
      "tasksdueDate": "12-12-2014",
      "TaskSubmitDate": "12-12-2014",
      "taskStatus": "success",
    },
    {
      "TaskName": "mark all  distance with elevation",
      "TaskAssignDate": "1-12-2024",
      "tasksdueDate": "12-12-2014",
      "TaskSubmitDate": "12-12-2025",
      "taskStatus": "success",
    },
    {
      "TaskName": "complete all measurment and submit distance with elecation",
      "TaskAssignDate": "1-12-2024",
      "tasksdueDate": "12-12-2014",
      "TaskSubmitDate": "12-12-2014",
      "taskStatus": "success",
    },
    {
      "TaskName": "make whole survey",
      "TaskAssignDate": "1-12-2024",
      "tasksdueDate": "12-12-2014",
      "TaskSubmitDate": "12-12-2014",
      "taskStatus": "Pending",
    },
    {
      "TaskName": "complete all measurment and submit distance with elecation",
      "TaskAssignDate": "1-12-2024",
      "tasksdueDate": "12-12-2014",
      "TaskSubmitDate": "12-12-2014",
      "taskStatus": "Pending",
    },
    {
      "TaskName": "complete all measurment and submit distance with elecation",
      "TaskAssignDate": "1-12-2024",
      "tasksdueDate": "12-12-2014",
      "TaskSubmitDate": "12-12-2014",
      "taskStatus": "success",
    },
    {
      "TaskName": "complete all measurment and submit distance with elecation",
      "TaskAssignDate": "1-12-2024",
      "tasksdueDate": "12-12-2014",
      "TaskSubmitDate": "12-12-2014",
      "taskStatus": "Pending",
    },
    {
      "TaskName": "complete all measurment and submit distance with elecation",
      "TaskAssignDate": "1-12-2024",
      "tasksdueDate": "12-12-2014",
      "TaskSubmitDate": "12-12-2014",
      "taskStatus": "success",
    },
    {
      "TaskName": "complete all measurment and submit distance with elecation",
      "TaskAssignDate": "1-12-2024",
      "tasksdueDate": "12-12-2014",
      "TaskSubmitDate": "12-12-2014",
      "taskStatus": "success",
    },
    {
      "TaskName": "complete all measurment and submit distance with elecation",
      "TaskAssignDate": "1-12-2024",
      "tasksdueDate": "12-12-2014",
      "TaskSubmitDate": "12-12-2014",
      "taskStatus": "success",
    },
    {
      "TaskName": "complete all measurment and submit distance with elecation",
      "TaskAssignDate": "1-12-2024",
      "tasksdueDate": "12-12-2014",
      "TaskSubmitDate": "12-12-2014",
      "taskStatus": "success",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 2 / 100,
            ),
            // Row(
            //   children: [
            //     InkWell(onTap: (){
            //       Navigator.pop(context);
            //     },
            //       child: Container(
            //         child: Icon(Icons.arrow_back_ios_new),
            //       ),
            //     ),
            //   ],
            // ),
            Container(
              child: Center(
                child: Text(
                  "Work_History",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: const Color.fromARGB(255, 206, 140, 140)),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: worklist.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 17 / 100,
                        width: MediaQuery.of(context).size.width * 80 / 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Column(
                          children: [
                          
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.8 /
                                  100,
                            ),
                            Container( width: MediaQuery.of(context).size.width * 80 / 100,
                            height: MediaQuery.of(context).size.height *
                                  3 /
                                  100,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    "${worklist[index]["TaskName"]}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white,fontFamily:AppFont.fontFamily,fontWeight:FontWeight.w600),
                                  ),
                                )),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 1 / 100,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    child: Center(
                                      child: Text(
                                        "TaskAssignDate:-",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // width: MediaQuery.of(context).size.width *
                                    //     50 /
                                    //     100,
                                    // color:Colors.amber,
                                    child: Text(
                                      "${worklist[index]["TaskAssignDate"]}",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.8 /
                                  100,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    child: Center(
                                      child: Text(
                                        "TasksdueDate:-",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // width: MediaQuery.of(context).size.width *
                                    //     50 /
                                    //     100,
                                    // color:Colors.amber,
                                    child: Text(
                                      "${worklist[index]["tasksdueDate"]}",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.8 /
                                  100,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    child: Center(
                                      child: Text(
                                        "TaskSubmitDate-",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // width: MediaQuery.of(context).size.width *
                                    //     50 /
                                    //     100,
                                    // color:Colors.amber,
                                    child: Text(
                                      "${worklist[index]["TaskSubmitDate"]}",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.8 /
                                  100,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    child: Center(
                                      child: Text(
                                        "TaskStatus-",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // width: MediaQuery.of(context).size.width *
                                    //     50 /
                                    //     100,
                                    // color:Colors.amber,
                                    child: Text(
                                      "${worklist[index]["taskStatus"]}",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 2 / 100,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
       bottomNavigationBar:
          footerUiForUsers(notificationCount: 0, selectMenu2: ButtomMenu2.UserWorkHistory),
    );
  }
}
