import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zam/core/constant/enum/collection_enum.dart';
import 'package:zam/model/user.dart';

class FirestoreServiceApp {
  static FirestoreServiceApp? _instance;

  static FirestoreServiceApp? get instance {
    _instance ??= FirestoreServiceApp._init();
    return _instance;
  }

  FirestoreServiceApp._init();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream getEventsStream() {
    return firestore.collection('events').snapshots();
  }

  Future registerUser(MyUser myUser) async {
    await firestore
        .collection(Collection.user.name)
        .doc(myUser.id)
        .set(myUser.toJson());
  }
}
