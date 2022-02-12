import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:zam/core/base/base_view_model.dart';
import 'package:zam/model/suggestion.dart';
import 'package:zam/services/place_api_services.dart';

class DataAddViewModel extends CustomBaseViewModel {
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
    searchController.clear();
    var res = await PlaceApiServices(const Uuid().v4()).getPlaceDetailFromId(places.elementAt(index).placeId);

    CameraUpdate camera = CameraUpdate.newLatLng(LatLng(res.result!.geometry!.location!.lat!, res.result!.geometry!.location!.lng!));
    markers.add(Marker(markerId: MarkerId('nokta'), position: LatLng(res.result!.geometry!.location!.lat!, res.result!.geometry!.location!.lng!)));
    places = [];
    controller.moveCamera(camera);
  }
}
