import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:surveyist/userModel/userProfilemodel.dart';

class FireStoreSerivcesForUser {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

//this code for specific user for from fire store..................
  Future<Userprofilemodel?> getUserProfile(String userid) async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection("allusers").doc(userid).get();
      if (snapshot.exists) {
       // print(snapshot.data());
        return Userprofilemodel.FromFireStore(snapshot);
      }
      return null;
    } catch (e) {
      print("Error fetching user profile: $e");
      return null;
    }
  }
}
