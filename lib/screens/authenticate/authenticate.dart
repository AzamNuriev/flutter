import 'package:flutter/material.dart';
import 'package:bf/screens/authenticate/sign_in.dart';
import 'register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSiggnIn = true;
  void toggleView() {
    setState(() => showSiggnIn = !showSiggnIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSiggnIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
