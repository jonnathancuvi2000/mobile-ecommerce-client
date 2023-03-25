import 'package:ecommerce_ui/pages/Register.dart';
import 'package:ecommerce_ui/utils/auth_controller.dart';
import 'package:ecommerce_ui/utils/login_data.dart';
import 'package:ecommerce_ui/widgets/custom_text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passworldController = TextEditingController();

  bool _loandingButton = false;

  Map<String, String> data = {};

  _LoginScreenState() {
    data = LoginData.signIn;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _LoginScreenState();
  }

  void switchLogin() {
    setState(() {
      if (mapEquals(data, LoginData.signUp)) {
        data = LoginData.signIn;
      } else {
        data = LoginData.signUp;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only( bottom: 40),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        "Iniciar Seccion",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 235, 122, 56),
                        ),
                      ),
                    ),
                    Text(
                     "Usa tu correo y contrasena",
                      style: TextStyle(
                        color: Color.fromARGB(255, 235, 122, 56),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            model(data, _emailController, _passworldController),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, 'register');
                      Get.to(()=>Register());
                    },
                    child: Text(
                      "Crear una nueva cuenta? Registrarse",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  model(Map<String, String> data, TextEditingController emailController,
      TextEditingController passworldController) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(right: 20, left: 20, top: 30, bottom: 56),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        // border: Border.all(
        //   width: 1,
        // ),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            // offset: Offset(
            //   1,
            //   1,
            // ),
            color: Colors.grey.shade400,
          ),
        ],
      ),
      child: Column(
        children: [
          CustomTextInput(
              label: "Direccion de Correo",
              placeholder: "email@gmail.com",
              icon: Icons.person_outline,
              textEditCOntorller: _emailController,
              password: false),
          CustomTextInput(
              label: "Password",
              placeholder: "password",
              icon: Icons.lock_outline,
              textEditCOntorller: _passworldController,
              password: true),
          ElevatedButton.icon(
            onPressed: () {
              // Navigator.pushNamed(context, 'home');
              AuthController.instance.login(_emailController.text.trim(), _passworldController.text.trim());

            },
            icon: Icon(Icons.person),
            label: Text(
              "Iniciar Seccion",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            // style: ButtonStyle(
            //   backgroundColor:
            //       MaterialStateProperty.all(Color.fromARGB(255, 235, 122, 56)),
            //   padding: MaterialStateProperty.all(
            //       EdgeInsets.symmetric(vertical: 13, horizontal: 40)),
            //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //       RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(30))),
            // ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 235, 122, 56),
              minimumSize: const Size.fromHeight(60), // NEW
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // <-- Radius
              ),
            ),
          )
        ],
      ),
    );
  }
}
