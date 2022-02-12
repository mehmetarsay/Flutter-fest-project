import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zam/core/constant/enum/collection_enum.dart';
import 'package:zam/model/place_data.dart';
import 'package:zam/model/place_user_data.dart';
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
  addPlace(PlaceData placeData)async{
   await firestore.collection('place').doc(placeData.placeId).set(placeData.toJson());
  }

  addPlaceUser(dynamic data,PlaceData placeData)async{
    await firestore.collection('place').doc(placeData.placeId).collection('users').add(data.toJson());
  }

 Future<PlaceData?> getPlace(String id)async{
    return await firestore.collection('place').doc(id).get().then((value) {
      if(value.data()!=null)
      return PlaceData().fromJson(value.data()!);
      else return null;
    });
  }
}
