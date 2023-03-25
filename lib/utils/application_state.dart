import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

enum ApplicationLoginState { loggedOut, loggedIn }

class AplicationState extends ChangeNotifier {
  // User? user;
  ApplicationLoginState loginState = ApplicationLoginState.loggedOut;
  AplicationState() {
    init();
  }

  Future<void> init() async {
    FirebaseAuth.instance.userChanges().listen((userFir) {
      if (userFir != null) {
        loginState = ApplicationLoginState.loggedIn;
        // user = userFir;
      } else {
        loginState = ApplicationLoginState.loggedOut;
      }
      notifyListeners();
    });
  }

  Future<void> singIn(String email, String password,
      void Function(FirebaseAuthException e) errorCallBack) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      errorCallBack(e);
    }
  }

  Future<void> singUp(String email, String password,
      void Function(FirebaseAuthException e) errorCallBack) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      // Stripe user create
    } on FirebaseAuthException catch (e) {
      errorCallBack(e);
    }
  }

  void signOut() async{
    await FirebaseAuth.instance.signOut();
  }
}
