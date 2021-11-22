import 'package:flutter/material.dart';
import 'package:bf/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bf/sevices/auth.dart';
import 'package:provider/provider.dart';
import 'package:bf/models/user.dart';

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
