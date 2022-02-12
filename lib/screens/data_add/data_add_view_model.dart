import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zam/core/base/base_view_model.dart';
import 'package:zam/screens/home/help/place.dart';

class DataAddViewModel extends CustomBaseViewModel{
  final Set<Marker> markers = {};
  late GoogleMapController controller;

  final searchController = TextEditingController();

  List<Place> _places = [];

  List<Place> get places => _places;

  set places(List<Place> value) {
    _places = value;
    notifyListeners();
  }
}