class DetailReport {
  String? title;
  double? point;
  List<int>? buildingAge=[];
  List<int>? rentMoney=[];
  List<int>? durability=[];
  List<int>? internetQuality=[];
  List<int>? electricityQuality=[];
  List<int>? waterQuality=[];
  List<int>? plumbingQuality=[];

  DetailReport({
    this.title,
    this.point,
    this.buildingAge,
    this.rentMoney,
    this.durability,
    this.internetQuality,
    this.electricityQuality,
    this.waterQuality,
    this.plumbingQuality
});
}