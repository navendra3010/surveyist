import 'package:flutter/foundation.dart';
import 'package:surveyist/fireStoreServiceForUser.dart/firestoreServiceUser.dart';
import 'package:surveyist/userModel/deviceInfomodel.dart';
import 'package:surveyist/userModel/deviceLocatioModel.dart';
import 'package:surveyist/userModel/userProfilemodel.dart';
import 'package:surveyist/userModel/userlogin.dart';

class CommanProviderForUser extends ChangeNotifier
{
  FireStoreSerivcesForUser fires=FireStoreSerivcesForUser();
String? userID;

 Userprofilemodel? userProfile;
//get user unique id----------------------------
void getUserId(id)
{
  userID=id;
  notifyListeners();
  print("--------------get user id-${userID}--------------------------");
}
///fatch user prfile using provider 
Future<Userprofilemodel?> getUserInfo()async
{
   if (userID != null) 
   {
     return await fires.getUserProfile(userID!);
   }
   else
   {
     print("User ID is null");
   }
//String? setId=userID;

  

}
getLoginDetail()
  {
//     UserLoginModel mdl=UserLoginModel();
//  print(mdl.toFireStore());
//  Deviceinformation df=Deviceinformation();
//  print(df.toFireStore());
//  Devicelocation dl=Devicelocation();
//  print(dl.toFireStore());
 

  }



}