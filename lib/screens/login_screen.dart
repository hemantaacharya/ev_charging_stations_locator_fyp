import 'package:ev_charging_stations_locator_fyp/screens/home_screen.dart';
import 'package:ev_charging_stations_locator_fyp/screens/signup_screen.dart';
import 'package:ev_charging_stations_locator_fyp/services/uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login(String email, String password) async {
    if (email == "" || password == "") {
      UiHelper.CustomAlertBox(context, "Please fill all the fields");
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        });
      } on FirebaseAuthException catch (ex) {
        return UiHelper.CustomAlertBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        automaticallyImplyLeading: false,
        title: const Text('Login Page'),
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(emailController, "Email", Icons.mail, false),
          UiHelper.CustomTextField(
              passwordController, "Password", Icons.password, true),
          const SizedBox(
            height: 30,
          ),
          UiHelper.CustomButton(() {
            login(emailController.text.toString(),
                passwordController.text.toString());
          }, "Login"),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account?",
                style: TextStyle(fontSize: 16),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupScreen()));
                  },
                  child: const Text("Sign Up",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)))
            ],
          )
        ],
      ),
    );
  }
}
