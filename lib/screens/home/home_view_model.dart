import 'dart:io';
import 'dart:typed_data';

import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:zam/core/base/base_view_model.dart';
import 'package:zam/model/detail_report.dart';
import 'package:zam/model/place.dart';
import 'package:zam/model/place_data.dart';
import 'package:zam/model/place_user_data.dart';
import 'package:zam/model/suggestion.dart';
import 'package:zam/services/firestore_services.dart';
import 'package:zam/services/place_api_services.dart';
import 'package:http/http.dart';

class HomeViewModel extends CustomBaseViewModel {
  final Set<Marker> markers = {};

  late GoogleMapController _controller;

  double _radius  = 0.1;

  double get radius => _radius;

  set radius(double value) {
    _radius = value;
    notifyListeners();
  }

  GoogleMapController get controller => _controller;

  set controller(GoogleMapController value) {
    _controller = value;
    notifyListeners();
  }

  final searchController = TextEditingController();

  List<Suggestion> _places = [];

  List<Suggestion> get places => _places;

  set places(List<Suggestion> value) {
    _places = value;
    notifyListeners();
  }

  Place? _selectPlace;

  Place? get selectPlace => _selectPlace;

  set selectPlace(Place? value) {
    _selectPlace = value;
    notifyListeners();
  }

  late BuildContext context;

  GlobalKey<ExpandableBottomSheetState> key = new GlobalKey();

  ExpansionStatus _expansionStatus = ExpansionStatus.contracted;

  DetailReport detailReport = DetailReport(
      buildingAge: [],
      durability: [],
      electricityQuality: [],
      internetQuality: [],
      plumbingQuality: [],
      rentMoney: [],
      waterQuality: []
  );


  init(BuildContext context){
    setInitialised(false);
    this.context =context;
    setInitialised(true);
    notifyListeners();
  }

  /// bir yer hakkında detaylı bilgi  getirir
  getPlaces() async {
    places.clear();
    if (searchController.text != '') {
      places = await PlaceApiServices(const Uuid().v4()).fetchSuggestions(searchController.text, 'tr');
    } else {
      places = [];
    }
    notifyListeners();
  }


  /// search method
  onTap(int index) async{
    searchController.clear();
    var res = await PlaceApiServices(const Uuid().v4()).getPlaceDetailFromId(places.elementAt(index).placeId);
    selectPlace = res;
    CameraUpdate camera = CameraUpdate.newLatLngZoom(LatLng(res.result!.geometry!.location!.lat!, res.result!.geometry!.location!.lng!), 17);

    selectPlace!.result!.placeId = places.elementAt(index).placeId;
    if(res.result!.types!.isNotEmpty&&res.result!.types!.contains('street_address')){

      var data = await rootBundle.load('assets/markers/home.png');
      Uint8List imageByte = data.buffer.asUint8List();
      markers.add(Marker(
          icon:BitmapDescriptor.fromBytes(imageByte),
          markerId: MarkerId('nokta'), position: LatLng(res.result!.geometry!.location!.lat!, res.result!.geometry!.location!.lng!)));
    }
    else{
      var data = await rootBundle.load('assets/markers/street.png');
      Uint8List imageByte = data.buffer.asUint8List();
      markers.add(Marker(
          icon:BitmapDescriptor.fromBytes(imageByte),
          markerId: MarkerId('nokta'), position: LatLng(res.result!.geometry!.location!.lat!, res.result!.geometry!.location!.lng!)));
    }

    places = [];
    FocusManager.instance.primaryFocus?.unfocus();
    controller.animateCamera(camera);
    pointCalculate();
  }


  ///distance calculate method
  pointCalculate()async{
    detailReport = DetailReport(
        buildingAge: [],
        durability: [],
        electricityQuality: [],
        internetQuality: [],
        plumbingQuality: [],
        rentMoney: [],
        waterQuality: []
    );
    double lat = selectPlace!.result!.geometry!.location!.lat!;
    double lng =  selectPlace!.result!.geometry!.location!.lng!;
   List<PlaceUserData> placeDatalist = await FirestoreServiceApp.instance!.firestore.collection('place').doc(selectPlace!.result!.placeId!).collection('users').get().then((value) {
     List<PlaceUserData> list = [];
      for( var place in value.docs){
        list.add(PlaceUserData.fromJson(place.data()));
      }
      return list;
    });
   detailReport.title = selectPlace!.result!.name!;
   for(var userPlace in placeDatalist){
     if(userPlace.buildingAge!=null&&userPlace.buildingAge!=0){
       detailReport.buildingAge!.add(userPlace.buildingAge!);
     }
     if(userPlace.durability!=null&&userPlace.durability!=0){
       detailReport.durability!.add(userPlace.durability!);
     }
     if(userPlace.electricityQuality!=null&&userPlace.electricityQuality!=0){
       detailReport.electricityQuality!.add(userPlace.electricityQuality!);
     }
     if(userPlace.internetQuality!=null&&userPlace.internetQuality!=0){
       detailReport.internetQuality!.add(userPlace.internetQuality!);
     }
     if(userPlace.plumbingQuality!=null&&userPlace.plumbingQuality!=0){
       detailReport.plumbingQuality!.add(userPlace.plumbingQuality!);
     }
     if(userPlace.rentMoney!=null&&userPlace.rentMoney!=0){
       detailReport.rentMoney!.add(userPlace.rentMoney!);
     }
     if(userPlace.waterQuality!=null&&userPlace.waterQuality!=0){
       detailReport.waterQuality!.add(userPlace.waterQuality!);
     }
   }
   notifyListeners();

  }

  
  
  /// yakınındaki noktalar
  dotsAround()async {
    double lat = selectPlace!.result!.geometry!.location!.lat!;
    double lng =  selectPlace!.result!.geometry!.location!.lng!;
    List<String> ids = [];
    List<PlaceData> placeDatalist = await FirestoreServiceApp.instance!.firestore.collection('place').get().then((value) {
      List<PlaceData> list = [];
      for(var i in value.docs){
        list.add(PlaceData().fromJson(i.data()));
      }
      return list;
    });
    for(var val in placeDatalist){
      if(Geolocator.distanceBetween(lat, lng, val.location!.lat!,  val.location!.lng!)<radius*1000){
        ids.add(val.placeId!);
      }
    }
    for(var i in ids){
      print(i);
    }
  }
}
