import 'package:e_com/widgets/custom_button.dart';
import 'package:e_com/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  Future<void> _alertDialogueBuilder(String error) async {
    return Get.dialog(
        AlertDialog(
          title: Text(error),
          actions: [
            TextButton(onPressed: () => Get.back(), child: Icon(Icons.cancel)),
          ],
        ),
        barrierDismissible: false);
  }

  Future<String> _createAccount() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _registeredEmail, password: _registeredPassword);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  void _submitForm() async {
    setState(() {
      _registrationLoading = true;
    });
    String _createAccountFeedback = await _createAccount();
    if (_createAccountFeedback != null) {
      _alertDialogueBuilder(_createAccountFeedback);
    }
    setState(() {
      _registrationLoading = false;
    });
  }

  bool _registrationLoading = false;
  String _registeredEmail = '';
  String _registeredPassword = '';
  FocusNode _passwordFocusNode;
  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

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
                    "Create a new Account",
                    style: kBoldHeading,
                    textAlign: TextAlign.center,
                  ),
                ),
                Column(
                  children: [
                    CustomTextField(
                      onChanged: (value) {
                        _registeredEmail = value;
                      },
                      onSubmitted: (value) {
                        _passwordFocusNode.requestFocus();
                      },
                      text: "Email",
                    ),
                    CustomTextField(
                      text: "Password",
                      onChanged: (value) {
                        _registeredPassword = value;
                      },
                      focusNode: _passwordFocusNode,
                      isPasswordField: true,
                      onSubmitted: (value) {
                        _submitForm();
                      },
                    ),
                    CustomButton(
                      outLineButton: false,
                      text: "Create Account",
                      onPressed: () {
                        _submitForm();
                      },
                      isLoading: _registrationLoading,
                    ),
                  ],
                ),
                CustomButton(
                  isLoading: false,
                  text: 'Back to Login',
                  onPressed: () {
                    Get.back();
                  },
                  outLineButton: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// setState(() {
//                           _registrationLoading = true;
//                         });