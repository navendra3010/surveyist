import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:surveyist/adminModel/allUsersModel.dart';

class FireStoreServiceForAdmin {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;



 
   Stream<List<ViewAllUsers>> getAllUsers() {
    return _firestore.collection("allusers").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
      for (var element in snapshot.docs) {
        print(element.data());
        
      }
        return ViewAllUsers.FromFireStore(doc);
      }).toList();
    });
  }
}
