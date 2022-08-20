import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'Utils.dart';
import 'main.dart';

class SignUpWeidget extends StatefulWidget {
  final Function() onClickedSignIn;

  SignUpWeidget({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  _SignUpWeidgetState createState() => _SignUpWeidgetState();
}

class _SignUpWeidgetState extends State<SignUpWeidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your email',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? "Enter a valid email"
                        : null,
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your password',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value != null && value.length < 6
                    ? "Enter a valid password"
                    : null,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: 350,
                  child: ElevatedButton(
                    onPressed: signUp,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                  )),
              SizedBox(
                height: 25,
              ),
              RichText(
                  text: TextSpan(
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      text: "Already have an account?  ",
                      children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickedSignIn,
                        text: "Log In",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue)),
                  ])),
              SizedBox(
                height: 30,
              ),
              /*Center(
                child: ElevatedButton.icon(
                  icon: FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.googleLogin();
                  },
                  label: Text("Sign Up with Google"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black, minimumSize: Size(100, 50)),
                ),
              )*/
            ],
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    /*showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));*/

    try {
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());
      User? user = result.user;
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }

    // navigator.of(context) not working!
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
