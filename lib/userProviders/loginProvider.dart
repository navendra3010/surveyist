import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:surveyist/admin_uI/adminDashboard.dart';
import 'package:surveyist/controller/fireStoreCollection.dart';
import 'package:surveyist/localization/deviceInformation.dart';
import 'package:surveyist/localization/location.dart';
import 'package:surveyist/repositry/firebaseAuthentication.dart';
import 'package:surveyist/users_UI/userDashboard.dart';
import 'package:surveyist/utils/appSnackBarOrToastMessage.dart';
import 'package:surveyist/utils/app_Language.dart';
import 'package:surveyist/utils/dateFormates.dart';
import 'package:intl/intl.dart';
import 'package:surveyist/localization/location.dart';

class LoginProviderForUser extends ChangeNotifier {
  // bool isloading = false;

  // String? currentUserId;
  // String? id;
  // String? device;
  // String? model;
  // String? brand;
  // String? board;

  // // Position? _currentPosition;
  // String? _currentAddress;

  // Future<void> userLoginAuthantication(
  //     BuildContext context, email, String password) async {
  //   int len = password.length;

  //   if (email.isEmpty || password.isEmpty) {
  //     ShowTaostMessage.toastMessage(
  //         context, Applanguage.entterEmailText[Applanguage.language]);
  //     return;
  //   } else if ((!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email))) {
  //     ShowTaostMessage.toastMessage(
  //         context, Applanguage.NotValidEmail[Applanguage.language]);
  //   } else if (password == "") {
  //     ShowTaostMessage.toastMessage(
  //         context, Applanguage.passwordNameessage[Applanguage.language]);
  //   } else if (len < 6) {
  //     ShowTaostMessage.toastMessage(
  //         context, Applanguage.passWordlength[Applanguage.language]);
  //   } else {
  //     isloading = true;
  //     notifyListeners();

  //     try {

  //       // Proceed with sign-in if user exists
  //       await FirebaseauthenticationStatus.auth
  //           .signInWithEmailAndPassword(email: email, password: password)
  //           .then((value) {
  //         currentUserId = FirebaseauthenticationStatus.auth.currentUser?.uid;

  //         //  print("user login id is ${userID}");
  //       });
  //       DeviceInfo deviceInfo = await DeviceInfo.loginDeviceInfo();
  //       board = deviceInfo.board;
  //       id = deviceInfo.id;
  //       device = deviceInfo.device;
  //       model = deviceInfo.model;
  //       brand = deviceInfo.brand;

  //       DateTime now = DateTime.now();
  //       String formattedDate = DateFormat('dd/MM/yyyy hh:mm:ss a').format(now);
  //       String dateKey = DateFormat('dd-MM-yyyy').format(now); // Date as key

  //       //print("the date and time${now}");
  //       CollectionData.sendUserLoginActivity(currentUserId, formattedDate,
  //           dateKey, model, brand, device, id, board);

  //       // Success flow
  //       ShowTaostMessage.toastMessage(context, "Login successful");
  //       isloading = false; // Reset loading after successful login
  //       notifyListeners();

  //       // notifyListeners();

  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => UserDashBoardScreen()),
  //       );
  //     } on FirebaseAuthException catch (e) {
  //       print("FirebaseAuthException: ${e.code}");
  //       String message;

  //       switch (e.code) {
  //         case 'invalid-credential':
  //         case 'wrong-password':
  //         case 'invalid-email':
  //           message = 'Invalid email or password. Please try again.';
  //           break;
  //         case 'user-not-found':
  //           message = 'No account found. Would you like to sign up?';
  //           break;
  //         case 'too-many-requests':
  //           message = 'Too many failed attempts. Try again later.';
  //           break;
  //         case 'user-disabled':
  //           message = 'This account has been disabled.';
  //           break;
  //         default:
  //           message = 'Login failed. Please check your details.';
  //       }

  //       isloading = false;
  //       notifyListeners();
  //       ShowTaostMessage.toastMessage(context, message);
  //     } catch (e) {
  //       print("Unknown error: $e");
  //       isloading = false;
  //       notifyListeners();
  //       ShowTaostMessage.toastMessage(
  //         context,
  //         'An unexpected error occurred. Please try again.',
  //       );
  //     }
  //   }
  // }

  /// there i wil handle permission............

  // ----------------------------//--------------------------------------------------new login with provider---------------------

  bool isloading = false;
  String? id;
  String? device;
  String? model;
  String? brand;
  String? board;
  String? address;

  Future<FirebaseAuth?> userLoginAuthantication(
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
      isloading = true;
      notifyListeners();
      monitorLocationService(context);
      try {
        await FirebaseauthenticationStatus.auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          // currentUserId = FirebaseauthenticationStatus.auth.currentUser?.uid;

          //  print("user login id is ${userID}");
        });

        if (FirebaseauthenticationStatus.auth != null) {
          Position? position = await _determinePosition(context);
          if (position != null) {
            address = await _getAddressFromLatLng(
                position.latitude, position.longitude);

            await getDeviceinfo();
            await _storeLoginDetails(
              FirebaseauthenticationStatus.auth.currentUser!.uid,
              address,
              position.latitude,
              position.longitude,
              id,
              device,
              model,
              brand,
              board,
            );
            //   FirebaseauthenticationStatus.auth.currentUser!.uid,

            //   id,
            //   device,
            //   model,
            //   brand,
            //   board,
            // );
            isloading = false;
            notifyListeners();
            return FirebaseauthenticationStatus.auth;
          }
        }
        //else {
        //   isloading = false;
        //   notifyListeners();
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(content: Text('Location is required to proceed.')),
        //   );

        // }
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
        print("Unknown error: $e");
        isloading = false;
        notifyListeners();
        ShowTaostMessage.toastMessage(
          context,
          'An unexpected error occurred. Please try again.',
        );
        return null;
      }
    }

    return null;
  }

  Future<String> getDeviceinfo() async {
    DeviceInfo deviceInfo = await DeviceInfo.loginDeviceInfo();
    board = deviceInfo.board;
    id = deviceInfo.id;
    device = deviceInfo.device;
    model = deviceInfo.model;
    brand = deviceInfo.brand;
    return '${board},${id},${board},${model},${brand}';
  }

  // Get Location
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

  // Get Address from Lat/Lng
  Future<String> _getAddressFromLatLng(double lat, double lng) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
    Placemark place = placemarks[0];
    return "${place.street}, ${place.locality}, ${place.country}";
  }

  Future<void> _storeLoginDetails(
      String uid,
      String? address,
      double latitude,
      double longitude,
      String? id,
      String? device,
      String? model,
      String? brand,
      String? board) async {
    // print(uid);
    // print(address);
    // print(latitude);
    // print(longitude);
    // print(id);
    // print(device);
    // print(model);
    // print(brand);
    // print(board);
    // print(uid);
    //print(uid);
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy a').format(now);
    String formattedTime = DateFormat(' hh:mm:ss a').format(now);

    String dateKey = DateFormat('dd-MM-yyyy').format(now); // Date as key
    await FirebaseFirestore.instance
        .collection("loginRecords")
        .doc(uid)
        .collection(dateKey)
        .add({
      "login_date": formattedDate,
      "Login_time": formattedTime,
      "latitude": latitude,
      "longitude": longitude,
      "address": address,
      "device_Id": id,
      "device_brand": brand,
      "device": device,
      "model": model,
      "board": board,
    });
  }

  // Show Dialog to Enable Location
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

  // Future<void> _storeLoginDetails(String uid, String? id, String? device,
  //     String? model, String? brand, String? board) async {
  //   print(uid);

  //   print(id);
  //   print(device);
  //   print(model);
  //   print(brand);
  //   print(board);
  //   // print(uid);
  //   //print(uid);
  // }
}

//n (PlatformException(ERROR_INVALID_CREDENTIAL, The supplied auth credential is incorrect, malformed or has expired.
