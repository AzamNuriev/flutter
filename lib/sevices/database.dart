import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  final CollectionReference coffeeCollection =
      FirebaseFirestore.instance.collection('coffee');
  Future updateUserData(String sugars, String name, int strength) async {
    return await coffeeCollection.doc(uid).set({
      'sugar': sugars,
      'name': name,
      'strength': strength,
    });
  }

  Stream<QuerySnapshot> get brews {
    return coffeeCollection.snapshots();
  }
}
