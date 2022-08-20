import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test123/Groups.dart';

import 'AuthPage.dart';

class t extends StatefulWidget {
  @override
  _tState createState() => _tState();
}

class _tState extends State<t> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return group();
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Some thing wrong!"),
              );
            } else {
              return AuthPage();
            }
          }),
    );
  }
}
