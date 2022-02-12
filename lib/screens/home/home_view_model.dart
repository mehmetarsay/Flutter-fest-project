import 'dart:io';
import 'dart:typed_data';

import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:zam/core/base/base_view_model.dart';
import 'package:zam/model/place.dart';
import 'package:zam/model/suggestion.dart';
import 'package:zam/services/place_api_services.dart';
import 'package:http/http.dart';

class HomeViewModel extends CustomBaseViewModel {
  final Set<Marker> markers = {};
  late GoogleMapController _controller;

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


  init(BuildContext context){
    setInitialised(false);
    this.context =context;
    setInitialised(true);
    notifyListeners();
  }
  getPlaces() async {
    places.clear();
    if (searchController.text != '') {
      places = await PlaceApiServices(const Uuid().v4()).fetchSuggestions(searchController.text, 'tr');
    } else {
      places = [];
    }
    notifyListeners();
  }

  onTap(int index) async{
    final client = Client();
    searchController.clear();
    var res = await PlaceApiServices(const Uuid().v4()).getPlaceDetailFromId(places.elementAt(index).placeId);
    selectPlace = res;
    CameraUpdate camera = CameraUpdate.newLatLngZoom(LatLng(res.result!.geometry!.location!.lat!, res.result!.geometry!.location!.lng!), 20);

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
  }
}
