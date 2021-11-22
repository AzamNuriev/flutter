import 'package:flutter/material.dart';
import 'package:my_coffee/models/coffee.dart';
import 'package:my_coffee/screens/home/settings_form.dart';
import 'package:my_coffee/sevices/auth.dart';
import 'package:my_coffee/sevices/database.dart';
import 'package:provider/provider.dart';
import 'coffee_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Coffee>?>.value(
        initialData: null,
        value: DatabaseService().coffee,
        child: Scaffold(
          backgroundColor: Colors.brown[50],
          appBar: AppBar(
            title: Text('Coffee prefers'),
            //backgroundColor: Colors.brown[480],
            backgroundColor: Colors.brown,
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('logout'),
                  onPressed: () async {
                    await _auth.signOut();
                  }),
              FlatButton.icon(
                icon: Icon(Icons.settings),
                label: Text('settings'),
                onPressed: () => _showSettingsPanel(),
              )
            ],
          ),
          body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/coffee_bg.png'),
                fit: BoxFit.cover,
              )),
              child: CoffeeList()),
        ));
  }
}
