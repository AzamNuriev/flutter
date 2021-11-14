import 'package:flutter/material.dart';
import 'package:my_coffee/screens/wrapper.dart';
import 'package:my_coffee/sevices/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('My coffee'),
        backgroundColor: Colors.brown[480],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();

                // Navigator.pop(context,
                //     MaterialPageRoute(builder: (context) => Wrapper()));
              })
        ],
      ),
    );
  }
}
