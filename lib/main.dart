import 'package:flutter/material.dart';
import 'package:my_coffee/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_coffee/sevices/auth.dart';
import 'package:provider/provider.dart';
import 'package:my_coffee/models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      value: AuthService().user,
      initialData: null,
      catchError: (User, CustomUser) => null,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
