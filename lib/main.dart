import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_ui/pages/CartPage.dart';
import 'package:ecommerce_ui/pages/Homepage.dart';
import 'package:ecommerce_ui/pages/ItemPage.dart';
import 'package:ecommerce_ui/pages/Login.dart';
import 'package:ecommerce_ui/pages/Register.dart';
import 'package:ecommerce_ui/utils/auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Firabse tutorials
// https://www.youtube.com/watch?v=HGrNobR60TA&t=1146s
// https://firebase.flutter.dev/docs/firestore/usage

void main() async {
  // se asegura de que todo lo de friebase este inicializado antes de lanzar el proyecto
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List usuarios = [];
  // this runs before the widget "MyApp" RUNS
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  void getUsers() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("users");

    QuerySnapshot users = await collectionReference
        .get(); // the get ruturns a "Future" so we have to add an "await" to wait until get the data from FIREBASE

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        // print(doc.data());
        usuarios.add(doc.data());
      }
      print(usuarios);
    } else {
      print('We could not get the data from FIRABASE');
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      // home: Login(),
      initialRoute: '/',
      routes: {
        "/": (context) => Login(),
        "register": (context) => Register(),
        "home": (context) => HomePage(),
        "cartPage": (context) => CartPage(),
        "itemPage": (context) => ItemPage(),
      },
    );
  }
}
