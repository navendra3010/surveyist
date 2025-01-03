import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surveyist/adminProvider/adminHomeProvider.dart';
import 'package:surveyist/utils/TextSyle.dart';

import 'package:surveyist/utils/appConstant.dart';
import 'package:surveyist/utils/appFooter.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ChangeNotifierProvider<Adminhomeprovider>(
          create: (context) => Adminhomeprovider(),
          child: Consumer<Adminhomeprovider>(
            builder: (context, Provider, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment:CrossAxisAlignment.start,
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
                            buildBoxContainer(context, "A"),
                            buildBoxContainer(context, "B")
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
                      "User_status",
                      style: CustomText.nameOfTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 1 / 100,
                  ),
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar:
          AppFooterUi(notificationCount: 0, selectMenu: ButtomMenu.home),
    );
  }

  Widget buildBoxContainer(BuildContext context, text) {
    return Container(
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
    );
  }
}
