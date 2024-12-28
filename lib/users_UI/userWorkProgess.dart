import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surveyist/providers/eligible.dart';
import 'package:surveyist/utils/TextSyle.dart';
import 'package:surveyist/utils/appConstant.dart';
import 'package:surveyist/utils/appLoader.dart';
import 'package:surveyist/utils/footerForUsers.dart';

class WorkProgess extends StatefulWidget {
  WorkProgess({super.key});

  @override
  State<WorkProgess> createState() => _WorkProgessState();
}

class _WorkProgessState extends State<WorkProgess> {
  TextEditingController agecontroller = TextEditingController();
   void showLoader()
   {
    Loader();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ChangeNotifierProvider<AgeCheckStatusProvider>(
          create: (context) => AgeCheckStatusProvider(),
          child: Consumer<AgeCheckStatusProvider>(
              builder: (context, provider, child) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text("${provider.message}",style:TextStyle(color:(provider.isEligible==true)?Colors.green:Colors.red)),
                TextField(
                  controller: agecontroller,
                  decoration: const InputDecoration(
                      hintText: "Enter age......",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
                TextButton(
                    onPressed: () {
                      int num=int.parse(agecontroller.text.toString());
                      provider.check( num);
                    },
                    child: Text(
                      "check",
                      style: CustomText.nameOfTextStyle,
                    )),
                   // CircularProgressIndicator(),
                    
                  
              ],
            );
          }),
        ),
      ),
      bottomNavigationBar: const footerUiForUsers(
          notificationCount: 0, selectMenu2: ButtomMenu2.progess),
    );
  }
}
