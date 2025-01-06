import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Adminhomeprovider extends ChangeNotifier {
  List<DocumentSnapshot> todaysLogins=[];
  Future<void> getTodayLogins() async {
    DateTime startOfDay = DateTime.now();
    DateTime endOfDay = startOfDay.add(Duration(days: 1));

     try{

     
      QuerySnapshot snapshot=await  FirebaseFirestore.instance
        .collection("loginRecords")
        .where('timestamp', isGreaterThanOrEqualTo: startOfDay)
        .where('timestamp', isLessThan: endOfDay)
        .get();
        todaysLogins=snapshot.docs;
        notifyListeners();



     }catch (e)
     {
       print("${e.toString()}");
     }

        
      
  }

  String _formatTimestamp(Timestamp timestamp) {
    DateTime date = timestamp.toDate();
    return '${date.hour}:${date.minute} - ${date.day}/${date.month}/${date.year}';
  }
}
