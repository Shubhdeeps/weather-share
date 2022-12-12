import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weather_share/src/pages/login_registrationPage.dart';
import 'package:weather_share/src/services/firebaseConfig.dart';
import 'package:weather_share/src/weatherShare.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      title: "WeatherShare",
      theme: ThemeData(fontFamily: 'Itim'),
      home: const IsAuthenticated(),
    ),
  );
}

class IsAuthenticated extends StatefulWidget {
  const IsAuthenticated({super.key});

  @override
  State<IsAuthenticated> createState() => _IsAuthenticatedState();
}

class _IsAuthenticatedState extends State<IsAuthenticated> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.active) {
          return const Center(child: CircularProgressIndicator());
        } else {
          // auth.signOut();
          final user = snapshot.data;
          if (user != null) {
            return WeatherShare(
              currentUserId: user.uid,
            );
          } else {
            return const LoginPage();
          }
        }
      },
    );
  }
}
