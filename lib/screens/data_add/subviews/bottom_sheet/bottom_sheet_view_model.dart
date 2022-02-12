import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zam/core/base/base_view_model.dart';
import 'package:zam/core/extension/context_extension.dart';
import 'package:zam/model/place.dart';
import 'package:zam/model/place_data.dart';
import 'package:zam/model/place_user_data.dart';
import 'package:zam/model/street_user_data.dart';
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

  StreetUserData _streetUserData = StreetUserData();

  StreetUserData get streetUserData => _streetUserData;

  set streetUserData(StreetUserData value) {
    _streetUserData = value;
    notifyListeners();
  }

  PlaceData? placeData;

  sendButton(Place place) async {
    placeData = await FirestoreServiceApp.instance!.getPlace(place.result!.placeId!);
    if (placeData == null) {
      placeData =PlaceData(
        location: place.result!.geometry!.location!,
        title: place.result!.name!,
        placeId: place.result!.placeId!,
        date: DateTime.now(),
        type: place.result!.types!.isNotEmpty&&place.result!.types!.contains('street_address')?'place':'street'
      );
      FirestoreServiceApp.instance!.addPlace(placeData!);
    }
    if (FirebaseAuth.instance.currentUser == null) {
      Fluttertoast.showToast(msg: 'Giriş Yapmanız Gerekmektedir.');
      context.navigateToReplacement(const LoginView());
      return;
    }
    placeUserData.id = FirebaseAuth.instance.currentUser!.uid;
    if(placeData!.type=='street'){
      if(streetUserData.buildQuality!=null||streetUserData.smell!=null||streetUserData.carPark!=null||streetUserData.electricityQuality!=null||streetUserData.internetQuality!=null||streetUserData.waterQuality!=null){
        FirestoreServiceApp.instance!.addPlaceUser(streetUserData, placeData!);
      }
      else{
        Fluttertoast.showToast(msg: 'Hepsi Boş olamaz');
      }

    }else{
      if(placeUserData.waterQuality!=null||placeUserData.internetQuality!=null||placeUserData.electricityQuality!=null||placeUserData.durability!=null||placeUserData.plumbingQuality!=null||placeUserData.rentMoney!=null||placeUserData.buildingAge!=null){
        FirestoreServiceApp.instance!.addPlaceUser(placeUserData, placeData!);
      }
      else{
        Fluttertoast.showToast(msg: 'Hepsi Boş olamaz');
      }

    }
    placeUserData = PlaceUserData(
      buildingAge: null,
      durability: null,
      electricityQuality: null,
      internetQuality: null,plumbingQuality: null,rentMoney: null,waterQuality: null
    );
    streetUserData = StreetUserData(
      carPark: null,
      smell: null,
      electricityQuality: null,
      internetQuality: null,
      buildQuality: null,
      waterQuality: null
    );
    Fluttertoast.showToast(msg: 'Gönderildi');
    notifyListeners();


  }
}
