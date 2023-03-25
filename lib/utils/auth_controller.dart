import 'package:ecommerce_ui/pages/HomePage.dart';
import 'package:ecommerce_ui/pages/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // whe we want to access to this instance we must to write "AuthController.instance......"
  static AuthController instance = Get.find();
  // email, password, name
  late Rx<User?>
      _user; // this user comes from friebase Autentification, It is like a model
  FirebaseAuth auth = FirebaseAuth
      .instance; // we access to a lot of properties from "firebase aunt"

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser); // we inicializi our user
    // our user wou=uld be notified
    _user.bindStream(auth
        .userChanges()); // with this it notified to the user if there any change
    ever(_user,
        _initialScreen); // everytime there is a change this funtion will be notified, and we send our user (_user) to the funtion "_initialScreen"
  }

  _initialScreen(User? user) {
    if (user == null) {
      print("login page");
      Get.offAll(() => Login());
    } else {
      Get.offAll(() => HomePage());
    }
  }

  void register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "Acerca del Usuario",
        "usuario Mensaje",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        titleText: Text(
          "Creacion de cuenta Fallida",
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(color: Colors.white),
        ),
      );
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "Inicio de Seccion",
        "Inicio Mensaje",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        titleText: Text(
          "Inicio de seccion fallida",
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(color: Colors.white),
        ),
      );
    }
  }

  void logOut() async {
    await auth.signOut();
  }
}
