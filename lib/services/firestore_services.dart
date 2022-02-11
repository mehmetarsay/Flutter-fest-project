

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServiceApp {
  static FirestoreServiceApp? _instance;

  static FirestoreServiceApp? get instance {
    _instance ??= FirestoreServiceApp._init();
    return _instance;
  }

  FirestoreServiceApp._init();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream getEventsStream(){
    return firestore.collection('events').snapshots();
  }
}