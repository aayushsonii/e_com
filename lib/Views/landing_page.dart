import 'package:e_com/Views/home_screen.dart';
import 'package:e_com/Views/login_page.dart';
import 'package:e_com/Views/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart ';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text(snapshot.error),
                  ),
                );
              }
              if (snapshot.connectionState == ConnectionState.active) {
                User _user = snapshot.data;
                if (_user == null) {
                  return LoginPage();
                } else {
                  return RegistrationPage();
                }
              }
              return HomeScreen();
            },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
