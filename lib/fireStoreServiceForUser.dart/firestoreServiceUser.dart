import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:surveyist/main.dart';
import 'package:surveyist/userModel/userProfilemodel.dart';
import 'package:surveyist/userModel/userlogin.dart';

class FireStoreSerivcesForUser {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DateTime now = DateTime.now();

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

  //logout fire store funcation
  Future<void> logout(userID) async {
    DateTime now = DateTime.now();

    String formattedDate = DateFormat('dd/MM/yyyy a').format(now);
    String formattedTime = DateFormat(' hh:mm:ss a').format(now);
    String dateKey = DateFormat('dd-MM-yyyy').format(now);

    try {
      final updateDoc = await
          _firestore.collection('userLoginRecordPerDay').doc(dateKey);

      final snapshot = await updateDoc.get();

      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>?;

        if (data != null &&
            data['logins'] != null &&
            data['logins'][userID] != null) {
          await updateDoc.update({
            'logins.$userID.logOut_time': formattedTime,
            'logins.$userID.logOut_date': formattedDate,
            'logins.$userID.logOut_status': true,
          });
        }
        else
        {
          print("userlogin does not exits");
        }
      }
    } catch (e) {
      print(e);
    }
  }
  //userLog Out firestore service.....................\
  Future<void>logOutService(String? userID)async
  {
     DateTime now = DateTime.now();

    String formattedDate = DateFormat('dd/MM/yyyy a').format(now);
    String formattedTime = DateFormat(' hh:mm:ss a').format(now);
    String dateKey = DateFormat('dd-MM-yyyy').format(now);
    final docUpdate=await _firestore.collection("userLoginRecordPerDay").doc(userID).update({
      "LogOut_time":formattedTime,
      "LogOut_status":false,
      "logOut_date":formattedDate,
    });
    print("update statstus");
    
   // print(docUpdate.);
    
  }


  
}
