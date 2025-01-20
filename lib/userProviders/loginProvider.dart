import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import 'package:surveyist/admin_uI/adminDashboard.dart';
import 'package:surveyist/controller/fireStoreCollection.dart';
import 'package:surveyist/localization/deviceInformation.dart';
import 'package:surveyist/localization/location.dart';
import 'package:surveyist/repositry/firebaseAuthentication.dart';
import 'package:surveyist/userModel/deviceInfomodel.dart';
import 'package:surveyist/userModel/deviceLocatioModel.dart';
import 'package:surveyist/userModel/userProfilemodel.dart';
import 'package:surveyist/userModel/userlogin.dart';
import 'package:surveyist/userProviders/commanProvider.dart';
import 'package:surveyist/users_UI/userDashboard.dart';

import 'package:surveyist/utils/appSnackBarOrToastMessage.dart';
import 'package:surveyist/utils/app_Language.dart';
import 'package:intl/intl.dart';

class LoginProviderForUser extends ChangeNotifier {
  String? id;
  String? device;
  String? model;
  String? brand;
  String? board;
  String? address;
  double? lat;
  double? long;

  User? currentUser;
  String? userRole;
  bool isloading = false;
  String? userID;
  Future<void> checkAuthstatus() async {
    currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      userRole = await fatchUserRole(currentUser!.uid);
      //here it will fatch role
    }
    bool isloading = true;
    notifyListeners();
  }
  //check user role or admin role....................

  Future<String?> fatchUserRole(String currentUserLoginId) async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('allusers')
        .doc(currentUserLoginId)
        .get();
    if (documentSnapshot.exists) {
      return documentSnapshot['role'];
    }
    return null;
  }

  Future<void> login(
      BuildContext context, String email, String password) async {
    int len = password.length;
    if (email.isEmpty || password.isEmpty) {
      ShowTaostMessage.toastMessage(
          context, Applanguage.entterEmailText[Applanguage.language]);
    } else if ((!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email))) {
      ShowTaostMessage.toastMessage(
          context, Applanguage.NotValidEmail[Applanguage.language]);
    } else if (password == "") {
      ShowTaostMessage.toastMessage(
          context, Applanguage.passwordNameessage[Applanguage.language]);
    } else if (len < 6) {
      ShowTaostMessage.toastMessage(
          context, Applanguage.passWordlength[Applanguage.language]);
    } else {
      try {
        isloading = true;
        monitorLocationService(context);
        notifyListeners();
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        currentUser = userCredential.user;
        if (currentUser != null) {
          userRole = await fatchUserRole(currentUser!.uid);

          if (userRole == "admin") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AdminDashboardPage()),
            );
          } else if (userRole == "user") {
            //here userLocation and device infomartion i will add
             getDeviceinfo();
            Position? position = await _determinePosition(context);
            if (position != null) {
              address = await _getAddressFromLatLng(
                  position.latitude, position.longitude);
              lat = position.latitude;
              long = position.longitude;
              // print("fathc location ---------------");
              // print(address);
              // print(lat);
              // print(long);
              // Devicelocation dl = await Devicelocation();
              // dl.address = address;
              // dl.latitude = lat;

              // dl.longitude = long;
              //  print(dl.toFireStore());
             //  UserLoginModel ulml=UserLoginModel();
               //ulml.location.add(Devicelocation(address: address,latitude: lat,longitude: long));
             // print(ulml.toFireStore());
              // print(dvlocation.toFireStore());

              // address = await _getAddressFromLatLng(
              //     position.latitude, position.longitude);
              //this funcation for Device info....................
            

              // right now iam commenting this for my tesing

              // storeLoginDetails(
              //   FirebaseauthenticationStatus.auth.currentUser!.uid,
              //   address,
              //   position.latitude,
              //   position.longitude,
              //   id,
              //   device,
              //   model,
              //   brand,
              //   board,
            
             
              print("get value==========================================");
              isloading = false;
              
              notifyListeners();
            }

            // );
 printoutPut();
            isloading = false;
            notifyListeners();
           
            Provider.of<CommanProviderForUser>(context, listen: false)
                .getUserId(userID);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UserDashBoardScreen(userId: userID)),
            );
          }
        }
      } on FirebaseAuthException catch (e) {
        String message;

        switch (e.code) {
          case 'invalid-credential':
          case 'wrong-password':
          case 'invalid-email':
            message = 'Invalid email or password. Please try again.';
            break;
          case 'user-not-found':
            message = 'No account found. Would you like to sign up?';
            break;
          case 'too-many-requests':
            message = 'Too many failed attempts. Try again later.';
            break;
          case 'user-disabled':
            message = 'This account has been disabled.';
            break;
          default:
            message = 'Login failed. Please check your details.';
        }
        isloading = false;
        notifyListeners();
        ShowTaostMessage.toastMessage(context, message);

        return null;
        // print("FirebaseAuthException: ${e.code}");
      } catch (e) {
        ShowTaostMessage.toastMessage(
          context,
          'An unexpected error occurred. Please try again.',
        );
      }
    }
  }

  //future type string..................................
  Future<String> getDeviceinfo() async {
    //this class for physicall devic info

   

    print(
        "devide function working----------------------------------------------");
    // dvinfo.board = deviceInfo.board;
    // Deviceinformation dvinfo = Deviceinformation();
    // dvinfo.device = deviceInfo.device;
    // dvinfo.deviceBrand = deviceInfo.brand;
    // dvinfo.model = deviceInfo.model;
    // dvinfo.deviceId = deviceInfo.id;
    //  board=dvinfo.board;
     DeviceInfo deviceInfo = await DeviceInfo.loginDeviceInfo();

    
    model = deviceInfo.model;
    brand = deviceInfo.brand;
    board=deviceInfo.board;

    device = deviceInfo.device;
    id=deviceInfo.id;
    print(" the given device info{$device,$model,$board,$id,$board}");
    notifyListeners();

    // Deviceinformation deviceData = Deviceinformation();

    // deviceData.board = deviceInfo.board;
    // deviceData.device = deviceInfo.device;
    // deviceData.model = deviceInfo.model;
    // deviceData.deviceBrand = deviceInfo.brand;
    // deviceData.deviceId = deviceInfo.id;

    //  UserLoginModel ulml2=UserLoginModel();
    //  ulml2.deviceinfo.add(Deviceinformation(board: deviceInfo.board,device: deviceInfo.device,deviceBrand: deviceInfo.brand,model: deviceInfo.model,deviceId:  deviceInfo.id));
    //  print(ulml2.toFireStore());

    //ending----------------------------------------------------------------
    return '${board},${id},${board},${model},${brand}';
  }
//location object-----------------------------

  Future<Position?> _determinePosition(BuildContext context) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return null;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _showLocationDialog(context);
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _showLocationDialog(context);
      return null;
    }

    // return null;

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<String> _getAddressFromLatLng(double lat, double lng) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
    Placemark place = placemarks[0];
    //  dvlocation.latitude=lat;
    //  dvlocation.longitude=lng;
    //  dvlocation.address=address;
    return "${place.street}, ${place.locality}, ${place.country}";
  }

  ///-/ another way to store logiin detail in firstore
//=--------------------------------------------------------------------------------------//
  Future<void> saveloginDetails(
      {required String userId,
      required Map<String, dynamic> loginDetails,
      required String daykey}) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      DocumentReference userDoc =
          firestore.collection('usersloginRecords').doc(userId);

      // Check if the user's document exists
      DocumentSnapshot userSnapshot = await userDoc.get();

      if (!userSnapshot.exists) {
        // Create the user's document if it doesn't exist
        await userDoc.set({
          'created_at': DateTime.now().toIso8601String(),
        });
        print("Parent document for userId $userId created.");
      }

      // Reference to the date-specific document
      DocumentReference dateDoc = userDoc.collection('loginDates').doc(daykey);

      // Check if the date-specific document exists
      DocumentSnapshot dateSnapshot = await dateDoc.get();

      if (!dateSnapshot.exists) {
        // Create the date document if it doesn't exist
        await dateDoc.set({
          'date': daykey,
          'created_at': DateTime.now().toIso8601String(),
        });
        print("Date document for $daykey created under userId $userId.");
      }

      // Add the login details to the logins subcollection
      await dateDoc.collection('logins').add(loginDetails);

      print("Login details for $daykey saved successfully for userId $userId.");
    } catch (e) {
      print("Error saving login details: $e");
    }
  }

  void storeLoginDetails(
      String uid,
      String? address,
      double latitude,
      double longitude,
      String? id,
      String? device,
      String? model,
      String? brand,
      String? board) async {
    String userId = uid; // Replace with actual user ID
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy a').format(now);
    String formattedTime = DateFormat(' hh:mm:ss a').format(now);

    String dateKey = DateFormat('dd-MM-yyyy').format(now);
    Map<String, dynamic> loginDetails = {
      'login_date': formattedDate,
      'Login_time': formattedTime,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'device_Id': id,
      'device_brand': brand,
      'device': device,
      'model': model,
      'board': board,
    };

    await saveloginDetails(
        userId: userId, loginDetails: loginDetails, daykey: dateKey);
  }

  void _showLocationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Location Access Required'),
        content: Text(
            'Location access is required to proceed. Please enable it in settings.'),
        actions: [
          TextButton(
            onPressed: () async {
              await Geolocator.openAppSettings();
              Navigator.pop(context);
            },
            child: Text('Open App Settings'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void monitorLocationService(BuildContext context) {
    Geolocator.getServiceStatusStream().listen((ServiceStatus status) async {
      if (status == ServiceStatus.enabled) {
        Navigator.pop(context); // Close dialog if location is enabled
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Location enabled. Please login again.')),
        );
      }
    });
  }

  Future<void> printoutPut() async {
    //UserLoginModel ul=UserLoginModel();
     id;
  print("$model, $brand,$board,$address,$lat,$long") ;
  Devicelocation deviceData=Devicelocation();
  deviceData.address=address;
  deviceData.latitude=lat;
  deviceData.longitude=long;
  Deviceinformation infoData=Deviceinformation();
  infoData.board=board;
  infoData.device=device;
  infoData.deviceId=id;
  infoData.model=model;
  infoData.board=brand;
  UserLoginModel usermodeData=UserLoginModel(location:[deviceData],deviceinfo: [infoData]);
  Map<String,dynamic>readData=usermodeData.toFireStore();
  print(" this code is working====-------------------------------${readData}");

  

  }
}

//n (PlatformException(ERROR_INVALID_CREDENTIAL, The supplied auth credential is incorrect, malformed or has expired.
