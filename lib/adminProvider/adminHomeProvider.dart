import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:surveyist/repositry/firebaseAuthentication.dart';

class Adminhomeprovider extends ChangeNotifier {
  bool isLoginRecord = false;
  List<DocumentSnapshot> todaysLogins = [];
  List<String> userIdLists = [];

  Future<void> getTodayLogins() async {
    isLoginRecord = true;
    notifyListeners();

    try {
      DateTime startOfDay = DateTime.now();
      DateTime endOfDay = startOfDay.add(Duration(days: 1));

      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection("loginRecords")
          .where('timestamp', isGreaterThanOrEqualTo: startOfDay)
          .where('timestamp', isLessThan: endOfDay)
          .orderBy('timestamp', descending: true) // Latest first
          .get();
      todaysLogins = snapshot.docs;
      // notifyListeners();
    } catch (e) {
      print("error fetching for today records${e.toString()}");
    } finally {
      isLoginRecord = false;
      notifyListeners();
    }
  }

  String _formatTimestamp(Timestamp timestamp) {
    DateTime date = timestamp.toDate();
    return '${date.hour}:${date.minute} - ${date.day}/${date.month}/${date.year}';
  }

  Future<void> getAllUserIds() async {
    try{
    
    //QuerySnapshot snapshot =
        //await FirebaseFirestore.instance.collection('User').get();
   // List<String> user_id = snapshot.docs.map((doc) => doc.id).toList();
   
   // userIdLists =  snapshot.docs.map((doc) => doc.id).toList();
  // var records=FirebaseauthenticationStatus.auth.Collection("User").doc(User.uid).get();
  QuerySnapshot snapshot=(await FirebaseFirestore.instance.collection("XNPVu6oFQ4YNKexrjYkuVgFGlrw2").get()) as QuerySnapshot<Object?>;
  userIdLists!=snapshot.docs.map((doc)=>doc.id).toList();
    isLoginRecord=false;
    notifyListeners();

    // for (var ides in user_id) {
    //   print(ides);
    //   notifyListeners();
    // }
  }catch(e){
    print(e);
  }
}
}
