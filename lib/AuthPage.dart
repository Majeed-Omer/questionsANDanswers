import 'package:flutter/cupertino.dart';

import 'SignUp.dart';
import 'login.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return isLogin
        ? LoginWidget(onClickSignUp: toggle)
        : SignUpWeidget(onClickedSignIn: toggle);
  }

  void toggle() => setState(() => isLogin = !isLogin);
}
