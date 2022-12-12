import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:weather_share/src/services/firebaseConfig.dart';
import 'package:weather_share/src/utils/AuthComponent/login_register.dart';
import '../utils/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String emailAddress = "";
  String password = "";
  bool isLoginPage = true;
  String error = "";
  bool isLoading = false;

  void onEmailChange(String text) {
    setState(() {
      emailAddress = text;
    });
  }

  void onPasswordChange(String text) {
    setState(() {
      password = text;
    });
  }

  void changePage() {
    isLoginPage = !isLoginPage;
    clearFields();
  }

  Future<void> singIn() async {
    try {
      setState(() {
        isLoading = true;
      });
      await auth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e.toString());
      Future.delayed(Duration.zero, () {
        setState(() {
          error = e.toString();
          isLoading = false;
        });
      });
    }
  }

  Future<void> register() async {
    try {
      setState(() {
        isLoading = true;
      });
      final res = await auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      profileRef.doc(res.user!.uid).set({
        "uid": res.user!.uid,
        "username": emailAddress.split("@")[0],
        "created": Timestamp.now(),
        "profileURL": "",
        "location": ""
      });
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
      Future.delayed(Duration.zero, () {
        setState(() {
          error = e.toString();
          isLoading = false;
        });
      });
    }
  }

  void clearFields() {
    setState(() {
      emailAddress = "";
      password = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return (() {
      if (isLoginPage) {
        return LoginRegister(
          titleName: "Sign in",
          infoText: "Don't have an account? register!",
          onEmailChange: onEmailChange,
          onPasswordChange: onPasswordChange,
          isLoginPage: isLoginPage,
          changePage: changePage,
          submitPress: singIn,
          error: error,
          isLoading: isLoading,
        );
      } else {
        return LoginRegister(
          titleName: "Register",
          infoText: "Already have an account? login",
          onEmailChange: onEmailChange,
          onPasswordChange: onPasswordChange,
          isLoginPage: isLoginPage,
          changePage: changePage,
          submitPress: register,
          error: error,
          isLoading: isLoading,
        );
      }
    }());
  }
}
