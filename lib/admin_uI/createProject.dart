import 'package:flutter/material.dart';
import 'package:surveyist/utils/appConstant.dart';
import 'package:surveyist/utils/appFont.dart';
import 'package:surveyist/utils/appFooter.dart';

class CreateProjectPage extends StatelessWidget {
  const CreateProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 3 / 100,
              ),
              Center(
                child: Card(
                  color: Colors.black,
                  child: Text(
                    "Create_New_project",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 1 / 100,
              ),
              Card(
                color: const Color.fromARGB(255, 92, 92, 92),
                child: Text(
                  "  Tittle of project    ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5 / 100,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "project_name.",
                    hintStyle:
                        TextStyle(fontSize: 12, fontFamily: AppFont.fontFamily),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5 / 100,
              ),
              Card(
                color: const Color.fromARGB(255, 92, 92, 92),
                child: Text(
                  " Scope    ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5 / 100,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Scope_Of_Project.._name.",
                    hintStyle:
                        TextStyle(fontSize: 12, fontFamily: AppFont.fontFamily),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5 / 100,
              ),
              Card(
                color: const Color.fromARGB(255, 92, 92, 92),
                child: Text(
                  " Location    ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5 / 100,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Scope_Of_Project.._name.",
                    hintStyle:
                        TextStyle(fontSize: 12, fontFamily: AppFont.fontFamily),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5 / 100,
              ),
              Card(
                color: const Color.fromARGB(255, 92, 92, 92),
                child: Text(
                  " Description    ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5 / 100,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 20 / 100,
                width: MediaQuery.of(context).size.width * 100 / 100,
                //color: Colors.amber,
                child: TextFormField(
                  maxLines: 15,
                  maxLength: 1000,
                  decoration: InputDecoration(
                      hintText: "Discription....",
                      hintStyle: TextStyle(
                          fontSize: 12, fontFamily: AppFont.fontFamily),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
            
              Card(
                color: const Color.fromARGB(255, 92, 92, 92),
                child: Text(
                  " Start_Date    ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppFooterUi(
          notificationCount: 0, selectMenu: ButtomMenu.createProject),
    );
  }
}
