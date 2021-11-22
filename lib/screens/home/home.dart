import 'package:flutter/material.dart';
import 'package:bf/models/bf.dart';
import 'package:bf/screens/home/settings_form.dart';
import 'package:bf/sevices/auth.dart';
import 'package:bf/sevices/database.dart';
import 'package:provider/provider.dart';
import 'bf_list.dart';

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

    return StreamProvider<List<BF>?>.value(
        initialData: null,
        value: DatabaseService().bf,
        child: Scaffold(
          backgroundColor: Colors.brown[50],
          appBar: AppBar(
            title: Text('BF prefers'),
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
                image: AssetImage('assets/bf_bg.png'),
                fit: BoxFit.cover,
              )),
              child: BFList()),
        ));
  }
}
