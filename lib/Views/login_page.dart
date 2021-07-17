import 'package:e_com/widgets/custom_button.dart';
import 'package:e_com/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Text(
                    "Welcome User,\nLogin to your Account",
                    style: kBoldHeading,
                    textAlign: TextAlign.center,
                  ),
                ),
                Column(
                  children: [
                    CustomTextField(
                      text: "Email",
                    ),
                    CustomTextField(
                      text: "Password",
                    ),
                    CustomButton(
                      outLineButton: false,
                      isLoading: false,
                      text: "LogIn",
                      onPressed: () {},
                    ),
                  ],
                ),
                CustomButton(
                  isLoading: false,
                  text: 'Create Account Button',
                  onPressed: () {
                    Get.toNamed(kRegistrationScreenRoute);
                  },
                  outLineButton: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
