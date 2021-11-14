import 'package:flutter/material.dart';
import 'package:my_coffee/models/user.dart';
import 'package:my_coffee/screens/authenticate/authenticate.dart';
import 'package:my_coffee/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:my_coffee/models/user.dart';

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
