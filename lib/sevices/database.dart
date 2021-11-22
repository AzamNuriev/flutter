import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_coffee/models/coffee.dart';
import 'package:my_coffee/models/user.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});
  final CollectionReference coffeeCollection =
      FirebaseFirestore.instance.collection('coffee');
  Future updateUserData(String sugars, String name, int strength) async {
    return await coffeeCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  List<Coffee> _coffeeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Coffee(
        name: doc.get('name') ?? '',
        strength: doc.get('strength') ?? 100,
        sugars: doc.get('sugars') ?? '0',
      );
    }).toList();
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.get('name') ?? '',
        strength: snapshot.get('strength') ?? 100,
        sugars: snapshot.get('sugars') ?? '0');
  }

// get
  Stream<List<Coffee>> get coffee {
    return coffeeCollection.snapshots().map(_coffeeListFromSnapshot);
  }

  Stream<UserData> get userData {
    return coffeeCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
