import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:zam/core/constant/app/app_constants.dart';
import 'package:zam/core/constant/enum/near_by_type_enum.dart';
import 'package:zam/core/extension/network_extension.dart';
import 'package:zam/model/near_by_place.dart';
import 'package:zam/model/place.dart';
import 'package:zam/model/suggestion.dart';

import '../core/constant/enum/network_enum.dart';
import '../core/init/network/network_manager.dart';

class PlaceApiServices {
  final client = Client();

  PlaceApiServices(this.sessionToken);

  final sessionToken;

  final apiKey = ApplicationConstants.googlePlaceApiKey;

  final NetworkManager? _networkManager = NetworkManager.instance;

  Future<List<Suggestion>> fetchSuggestions(String input, String lang) async {
    final request =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=address&language=$lang&components=country:tr&key=$apiKey&sessiontoken=$sessionToken';
    final response = await client.get(Uri.parse(request));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['status'] == 'OK') {
        // compose suggestions in a list
        return result['predictions']
            .map<Suggestion>((p) => Suggestion(p['place_id'], p['description']))
            .toList();
      }
      if (result['status'] == 'ZERO_RESULTS') {
        return [];
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }

  Future<Place> getPlaceDetailFromId(String placeId) async {
    final request =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey&sessiontoken=$sessionToken';
    final response = await client.get(Uri.parse(request));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);

      if (result['status'] == 'OK') {
        Place place = Place().fromJson(result);
        return place;
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }

  Future getNearBySearch(
          String location, int radius, NearByType nearByType) async =>
      await _networkManager!.get(Network.nearBySearch.value, NearByPlace(),
          queryParameters: {
            'key': apiKey,
            'location': location,
            'radius': radius,
            'type': nearByType.name
          });
}
