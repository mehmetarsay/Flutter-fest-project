import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zam/core/constant/enum/collection_enum.dart';
import 'package:zam/model/place_data.dart';
import 'package:zam/model/place_user_data.dart';
import 'package:zam/model/street_user_data.dart';
import 'package:zam/model/user.dart';

class FirestoreServiceApp {
  static FirestoreServiceApp? _instance;

  static FirestoreServiceApp? get instance {
    _instance ??= FirestoreServiceApp._init();
    return _instance;
  }

  FirestoreServiceApp._init();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future registerUser(MyUser myUser) async {
    await firestore
        .collection(Collection.user.name)
        .doc(myUser.id)
        .set(myUser.toJson());
  }

  Future<MyUser> loginUser(String userId) async {
    return MyUser().fromJson(
        (await firestore.collection(Collection.user.name).doc(userId).get())
            .data()!);
  }

  addPlace(PlaceData placeData) async {
    await firestore
        .collection('place')
        .doc(placeData.placeId)
        .set(placeData.toJson());
  }

  addPlaceUser(dynamic data, PlaceData placeData) async {
    await firestore
        .collection('place')
        .doc(placeData.placeId)
        .collection('users')
        .add(data.toJson());
    await firestore
        .collection('userPlace')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(placeData.type!)
        .add({
      'placeData': placeData.toJson(),
      'data': data.toJson(),
    });
  }

  Future<PlaceData?> getPlace(String id) async {
    return await firestore.collection('place').doc(id).get().then((value) {
      if (value.data() != null)
        return PlaceData().fromJson(value.data()!);
      else
        return null;
    });
  }

  dynamic getMyPlace(Collection collection) async {
    try {
      return await firestore
          .collection(Collection.userPlace.name)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(collection.name)
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          var list = [];
          for (var i in value.docs) {
            list.add({
              'placeData': PlaceData().fromJson(i.data()['placeData']),
              'data': collection == Collection.place
                  ? PlaceUserData.fromJson(i.data()['data'])
                  : StreetUserData.fromJson(i.data()['data']),
            });
          }
          return list;
        } else
          return [];
      });
    } catch (e) {
      return [];
    }

  }
}
