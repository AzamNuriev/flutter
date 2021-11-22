import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_coffee/models/user.dart';
import 'package:my_coffee/sevices/database.dart';
import 'package:my_coffee/shared/constants.dart';
import 'package:my_coffee/shared/loading.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  String? _currentName;
  String? _currentSugars;
  int? _currentStrength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData? userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update your coffee settings.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userData!.name,
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val!.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  DropdownButtonFormField(
                    decoration: textInputDecoration,
                    value: _currentSugars ?? userData.sugars,
                    onChanged: (val) {
                      setState(() => _currentSugars = val as String?);
                    },
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                        child: Text("$sugar sugars"),
                        value: sugar,
                      );
                    }).toList(),
                  ),
                  Slider(
                      min: 100.0,
                      max: 900.0,
                      divisions: 8,
                      value: (_currentStrength ?? userData.strength).toDouble(),
                      activeColor:
                          Colors.brown[_currentStrength ?? userData.strength],
                      inactiveColor:
                          Colors.brown[_currentStrength ?? userData.strength],
                      onChanged: (val) =>
                          setState(() => _currentStrength = val.round())),
                  SizedBox(height: 20.0),
                  RaisedButton(
                      color: Colors.pink[400],
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await DatabaseService(uid: user.uid).updateUserData(
                              _currentSugars ?? userData.sugars,
                              _currentName ?? userData.name,
                              _currentStrength ?? userData.strength);
                          Navigator.pop(context);
                        }
                      })
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
