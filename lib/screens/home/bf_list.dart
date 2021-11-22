import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bf/models/bf.dart';
import 'package:provider/provider.dart';
import 'bf_tile.dart';

class BFList extends StatefulWidget {
  @override
  _BFListState createState() => _BFListState();
}

class _BFListState extends State<BFList> {
  @override
  Widget build(BuildContext context) {
    final bfs = Provider.of<List<BF>?>(context) ?? [];

    return ListView.builder(
      itemCount: bfs.length,
      itemBuilder: (context, index) {
        return BFTile(bf: bfs[index]);
      },
    );
  }
}
