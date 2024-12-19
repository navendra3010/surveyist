import 'package:flutter/material.dart';
import 'package:surveyist/UI_for_all/splashUI.dart';
import 'package:surveyist/utils/appFont.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: AppFont.fontFamily,
        
      ),
      home: const Splash(),
    );
  }
}
