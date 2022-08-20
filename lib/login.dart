import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'Utils.dart';
import 'main.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback onClickSignUp;

  LoginWidget({
    Key? key,
    required this.onClickSignUp,
  }) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your Email',
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your Password',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                width: 350,
                child: ElevatedButton(
                  onPressed: signIn,
                  child: Text(
                    "signIn",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                )),
            SizedBox(
              height: 25,
            ),
            RichText(
                text: TextSpan(
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    text: "No account?  ",
                    children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickSignUp,
                      text: "Sign Up",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue))
                ])),
          ],
        ),
      ),
    );
  }

  Future signIn() async {
    /*showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));*/

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }

    // navigator.of(context) not working!
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
