import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  String? userName;
  String? employeId;
  String? unique_Id;

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
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      userName = data['full_name'];
      unique_Id = data['unique_Id'];
      employeId = data['employeId'];
      print("user details--------------------------");
      print("{$userName,$employeId,$unique_Id,}");

      print(documentSnapshot.data());
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
        //isloading = false;
        //monitorLocationService(context);
        notifyListeners();
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        String getcurrentUserId = FirebaseAuth.instance.currentUser!.uid;
        id = getcurrentUserId;

        SharedPreferences sf = await SharedPreferences.getInstance();
        sf.setString("userId", getcurrentUserId);
        notifyListeners();

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

              // address = await _getAddressFromLatLng(
              //     position.latitude, position.longitude);
              //this funcation for Device info....................

              print("get value==========================================");
                Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      UserDashBoardScreen(userId: currentUser!.uid)),
            );
              isloading = false;

              notifyListeners();
            }

            isloading = false;
            notifyListeners();

          
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

    DeviceInfo deviceInfo = await DeviceInfo.loginDeviceInfo();

    model = deviceInfo.model;
    brand = deviceInfo.brand;
    board = deviceInfo.board;

    device = deviceInfo.device;
    id = deviceInfo.id;
    brand = deviceInfo.brand;
    print(" the given device info{$device,$model,$board,$id,$board,$brand}");
    notifyListeners();

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
      // _showLocationDialog(context);
      monitorLocationService(context);

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

    return "${place.street}, ${place.locality}, ${place.country}";
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

  Future<void> storeLoginDetailAsperUserRecord(id) async {
    //UserLoginModel ul=UserLoginModel();
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy a').format(now);
    String formattedTime = DateFormat(' hh:mm:ss a').format(now);
    String dateKey = DateFormat('dd-MM-yyyy').format(now);

    //  print("$model, $brand,$board,$address,$lat,$long");
    Devicelocation deviceData = Devicelocation();
    deviceData.address = address;
    deviceData.latitude = lat;
    deviceData.longitude = long;
    Deviceinformation infoData = Deviceinformation();
    infoData.board = board;
    infoData.device = device;
    infoData.deviceId = id;
    infoData.model = model;
    infoData.deviceBrand = brand;
    UserLoginModel usermodeData = UserLoginModel(
      location: [deviceData],
      deviceinfo: [infoData],
      userName: userName,
      uniqueId: unique_Id,
      userEmpId: employeId,
      loginTime: formattedTime,
      loginDate: formattedDate,
      loginStatus: true,
    );
    Map<String, dynamic> readData = usermodeData.toFireStore();

    await createCollection(id: id, dateKey: dateKey, data: readData);
  }

  Future<void> createCollection(
      {required id,
      required String dateKey,
      required Map<String, dynamic> data}) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      DocumentReference docRef =
          firestore.collection("userLoginRecordPerDay").doc(id);

      DocumentSnapshot userSnapshot = await docRef.get();

      if (!userSnapshot.exists) {
        await docRef.set({
          'createdAT': DateTime.now(),
        });
        print("parent documnet created succesfully");
      }

      DocumentReference dateDoc = docRef.collection("loginDates").doc(dateKey);
      DocumentSnapshot userDateSnapshot = await dateDoc.get();
      if (!userDateSnapshot.exists) {
        await dateDoc.set({'createdAT': DateTime.now()});
        print("another parent document");
      }
      await dateDoc.collection("logins").add(data);
    } catch (e) {
      print("Error saving login details: $e");
    }
  }
}

//n (PlatformException(ERROR_INVALID_CREDENTIAL, The supplied auth credential is incorrect, malformed or has expired.
