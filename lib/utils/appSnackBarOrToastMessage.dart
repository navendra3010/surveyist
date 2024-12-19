import 'package:flutter/material.dart';

class ShowTaostMessage
{
  ShowTaostMessage();

  static toastMessage(BuildContext context ,String message)
  {
ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  backgroundColor:const Color.fromARGB(255, 73, 177, 215),
   duration: Duration(milliseconds: 2000),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
  
  
  
  content:Center(child: Text(message))));
  }
}