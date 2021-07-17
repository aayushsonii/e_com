import 'package:e_com/Views/landing_page.dart';
import 'package:e_com/Views/login_page.dart';
import 'package:e_com/Views/registration_page.dart';
import 'package:e_com/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // Get.lazyPut(() => CustomButtonController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: Scaffold(
        body: LandingPage(),
      ),
      getPages: [
        GetPage(name: kLogInScreenRoute, page: () => LoginPage()),
        GetPage(name: kRegistrationScreenRoute, page: () => RegistrationPage()),
        GetPage(name: kLandingScreenRoute, page: () => LandingPage()),
        // GetPage(name: "/fourth", page: () => Fourth()),
      ],
    );
  }
}
