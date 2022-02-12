import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zam/core/base/base_view_model.dart';
import 'package:zam/core/extension/context_extension.dart';
import 'package:zam/model/place.dart';
import 'package:zam/model/place_data.dart';
import 'package:zam/model/place_data.dart';
import 'package:zam/model/place_data.dart';
import 'package:zam/model/place_user_data.dart';
import 'package:zam/screens/login/login_view.dart';
import 'package:zam/services/auth_services.dart';
import 'package:zam/services/firestore_services.dart';

class DataAddBottomSheetViewModel extends CustomBaseViewModel {
  PlaceUserData _placeUserData = PlaceUserData();

  PlaceUserData get placeUserData => _placeUserData;

  set placeUserData(PlaceUserData value) {
    _placeUserData = value;
    notifyListeners();
  }

   PlaceData? placeData;



  sendButton(Place place) async {
    placeData =  await FirestoreServiceApp.instance!.getPlace(place.result!.placeId!);
    if(placeData==null){
       PlaceData(location: place.result!.geometry!.location!, title: place.result!.name!, placeId: place.result!.placeId!, date: DateTime.now());
      FirestoreServiceApp.instance!.addPlace(placeData!);
    }
    if(FirebaseAuth.instance.currentUser==null){
      Fluttertoast.showToast(msg: 'Giriş Yapmanız Gerekmektedir.');
      context.navigateToReplacement(const LoginView());
      return;
    }
   placeUserData.id = FirebaseAuth.instance.currentUser!.uid;

    FirestoreServiceApp.instance!.addPlaceUser(placeUserData, placeData!);

  }
}
