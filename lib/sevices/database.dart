import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bf/models/bf.dart';
import 'package:bf/models/user.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});
  final CollectionReference bfCollection =
      FirebaseFirestore.instance.collection('bf');
  Future updateUserData(String sugars, String name, int strength) async {
    return await bfCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  List<BF> _bfListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return BF(
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
  Stream<List<BF>> get bf {
    return bfCollection.snapshots().map(_bfListFromSnapshot);
  }

  Stream<UserData> get userData {
    return bfCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
