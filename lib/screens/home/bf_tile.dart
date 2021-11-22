import 'package:flutter/material.dart';
import 'package:bf/models/bf.dart';

class BFTile extends StatelessWidget {
  final BF bf;
  BFTile({required this.bf});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[bf.strength],
            backgroundImage: AssetImage('assets/bf_icon.png'),
          ),
          title: Text(bf.name),
          subtitle: Text('Takes ${bf.sugars} sugar(s)'),
        ),
      ),
    );
  }
}
