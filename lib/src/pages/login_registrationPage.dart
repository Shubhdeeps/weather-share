import 'package:flutter/material.dart';
import 'package:weather_share/src/services/firebaseConfig.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Login"),
    );
  }
}
