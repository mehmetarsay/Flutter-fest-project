import 'package:google_maps_flutter/google_maps_flutter.dart';

class ApplicationConstants {
  static const CameraPosition kGooglePlex = CameraPosition(
      target: LatLng(41.015203276923806, 28.952479892871022), zoom: 14.4746);

  static const String googlePlaceApiKey = 'AIzaSyAuL4wISum-tvnF5MElq2w83ODiq-KUC1o';
  static const String basePlaceUrl =
      'https://maps.googleapis.com/maps/api/place';
}
