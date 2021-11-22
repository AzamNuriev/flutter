import 'package:flutter/material.dart';
import 'package:bf/models/user.dart';
import 'package:bf/screens/authenticate/authenticate.dart';
import 'package:bf/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:bf/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
