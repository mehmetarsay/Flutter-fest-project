import 'package:flutter/material.dart';
import 'package:zam/core/base/base_view_model.dart';
import 'package:zam/core/constant/enum/collection_enum.dart';
import 'package:zam/services/firestore_services.dart';

class MyCollectionViewModel extends CustomBaseViewModel {
  var listPlace;
  var listStreet;

  void init(BuildContext context) async {
    this.context = context;
    isLoading = true;
    listPlace = await FirestoreServiceApp.instance!.getMyPlace(Collection.place);
    listStreet = await FirestoreServiceApp.instance!.getMyPlace(Collection.street);
    isLoading = false;
    print('debug');
  }

}