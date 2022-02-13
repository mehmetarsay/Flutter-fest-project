import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zam/model/near_by_place.dart';

class DetailReport {
  String? title;
  double? point;
  List<int>? buildingAge = [];
  List<int>? rentMoney = [];
  List<int>? durability = [];
  List<int>? internetQuality = [];
  List<int>? electricityQuality = [];
  List<int>? waterQuality = [];
  List<int>? plumbingQuality = [];
  dynamic placeNearBy;

  DetailReport(
      {this.title,
      this.point,
      this.buildingAge,
      this.rentMoney,
      this.durability,
      this.internetQuality,
      this.electricityQuality,
      this.waterQuality,
      this.plumbingQuality,
      this.placeNearBy}) {
    placeNearBy = {
      'school': {'name': 'Okul', 'list': [],'icon':Icons.school,'max':4},
      'pharmacy': {'name': 'Eczane', 'list': [],'icon':Icons.local_pharmacy,'max':4},
      'bank': {'name': 'Banka', 'list': [],'icon':Icons.monetization_on,'max':5},
      'hospital': {'name': 'Hastane', 'list': [],'icon':Icons.local_hospital,'max':2},
      'market': {'name': 'Market', 'list': [],'icon':Icons.store,'max':10},
      'gym': {'name': 'Spor Salonu', 'list': [],'icon':Icons.sports_baseball_outlined,'max':2},
      'park': {'name': 'Park', 'list': [],'icon':Icons.park,'max':2},
      'mosque': {'name': 'Cami', 'list': [],'icon':Icons.wb_sunny_outlined,'max':2},
    };
  }
}
