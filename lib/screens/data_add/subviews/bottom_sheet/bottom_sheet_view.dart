import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:stacked/stacked.dart';
import 'package:zam/model/place.dart';
import 'package:zam/screens/data_add/subviews/bottom_sheet/bottom_sheet_view_model.dart';

class DataAddBottomSheet extends StatelessWidget {
  const DataAddBottomSheet({Key? key, required this.place}) : super(key: key);
  final Place place;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DataAddBottomSheetViewModel>.reactive(
        viewModelBuilder: () => DataAddBottomSheetViewModel(),
        builder: (context, viewModel, child) {
          return Container(
            constraints: BoxConstraints(
              maxHeight: 800,
            ),
            height: MediaQuery.of(context).size.height/1.3,
            decoration: BoxDecoration(
                color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10))
            ),
            
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              place.result!.name!,
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 15,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: place.result!.types!.isNotEmpty&&place.result!.types!.contains('street_address')?Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                spinBoxWidget('Bina Ya???? ${viewModel.placeUserData.buildingAge??''}', onChange: (value) {
                                  viewModel.placeUserData.buildingAge = value;
                                  viewModel.notifyListeners();
                                }, desc: 'Binan??n yap??m y??l??ndan ??imdiye kadar ge??en s??re. Bilmiyorsan??n 0 olarak b??rakabilirsiniz.'),
                                spinBoxWidget('Su Kalitesi ${viewModel.placeUserData.waterQuality??''}', max: 5, icon: Icons.water, onChange: (value) {
                                  viewModel.placeUserData.waterQuality = value;
                                  viewModel.notifyListeners();
                                }, desc: 'Binan??n i??ine gelen suyun kalitesini kendi a????n??zdan 1-5 aras??nda puanlay??n??z '),
                                spinBoxWidget('??dedi??iniz Kira ${viewModel.placeUserData.rentMoney??''} TL', max: 100000, icon: Icons.money, onChange: (value) {
                                  viewModel.placeUserData.rentMoney = value;
                                  viewModel.notifyListeners();
                                }, desc: 'Kirada oturuyorsan??nz kiran??z?? giriniz. Girmek istemezseniz 0 olarak b??rak??n??z '),
                                spinBoxWidget('Tesisat Kalitesi ${viewModel.placeUserData.plumbingQuality??''}', max: 5, icon: Icons.wrap_text, onChange: (value) {
                                  viewModel.placeUserData.plumbingQuality = value;
                                  viewModel.notifyListeners();
                                }, desc: 'Binan??n i??indeki tesisat kalitesini kendi a????n??zdan 1-5 aras??nda puanlay??n??z '),
                                spinBoxWidget('??nternet Kalitesi ${viewModel.placeUserData.internetQuality??''}', max: 5, icon: Icons.network_check, onChange: (value) {
                                  viewModel.placeUserData.internetQuality = value;
                                  viewModel.notifyListeners();
                                }, desc: 'Binada ki internet kalitesini kendi a????n??zdan 1-5 aras??nda puanlay??n??z '),
                                spinBoxWidget('Elektirik Kalitesi ${viewModel.placeUserData.electricityQuality??''}', max: 5, icon: Icons.whatshot, onChange: (value) {
                                  viewModel.placeUserData.electricityQuality = value;
                                  viewModel.notifyListeners();
                                }, desc: 'Binan??n i??inde ki elektiri??in kesilip kesilmedi??i durumuna g??re kendi a????n??zdan 1-5 aras??nda puanlay??n??z '),
                                spinBoxWidget('Dayan??kl??l??k ${viewModel.placeUserData.durability??''}', max: 5, icon: Icons.spellcheck, onChange: (value) {
                                  viewModel.placeUserData.durability = value;
                                  viewModel.notifyListeners();
                                }, desc: 'Binan??n dayan??kl??l??????n?? kendi a????n??zdan 1-5 aras??nda puanlay??n??z '),
                                SizedBox(
                                  height: 40,
                                ),
                              ],
                            ):
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    spinBoxWidget('Araba Park ${viewModel.streetUserData.carPark??''}',
                                        icon: Icons.local_parking,
                                        onChange: (value) {
                                      viewModel.streetUserData.carPark = value;
                                      viewModel.notifyListeners();
                                    }, desc: 'Araba park etme a????s??ndan soka????n kullan??m?? nas??l? ??ok iyi 5 k??t?? 0'),
                                    spinBoxWidget('Su Kalitesi ${viewModel.streetUserData.waterQuality??''}', max: 5, icon: Icons.water, onChange: (value) {
                                      viewModel.streetUserData.waterQuality = value;
                                      viewModel.notifyListeners();
                                    }, desc: 'Sokaktan ge??en suyun kalitesini kendi a????n??zdan 1-5 aras??nda puanlay??n??z '),
                                    spinBoxWidget('Koku ${viewModel.streetUserData.smell??''} ', max: 5, icon: Icons.wb_iridescent_rounded, onChange: (value) {
                                      viewModel.streetUserData.smell = value;
                                      viewModel.notifyListeners();
                                    }, desc: 'Sokaktaki kokuyu bize puanlay??n??z? ??ok g??zel 5/ ??ok k??t?? 0'),
                                    spinBoxWidget('??nternet Kalitesi ${viewModel.placeUserData.internetQuality??''}', max: 5, icon: Icons.network_check, onChange: (value) {
                                      viewModel.placeUserData.internetQuality = value;
                                      viewModel.notifyListeners();
                                    }, desc: 'Sokaktaki ki internet kalitesini kendi a????n??zdan 1-5 aras??nda puanlay??n??z '),
                                    spinBoxWidget('Elektirik Kalitesi ${viewModel.placeUserData.electricityQuality??''}', max: 5, icon: Icons.whatshot, onChange: (value) {
                                      viewModel.placeUserData.electricityQuality = value;
                                      viewModel.notifyListeners();
                                    }, desc: 'Soka????n i??inde ki elektiri??in kesilip kesilmedi??i durumuna g??re kendi a????n??zdan 1-5 aras??nda puanlay??n??z '),
                                    spinBoxWidget('Soka????n Yap??m Kalitesi ${viewModel.streetUserData.buildQuality??''}', max: 5, icon: Icons.spellcheck, onChange: (value) {
                                      viewModel.streetUserData.buildQuality = value;
                                      viewModel.notifyListeners();
                                    }, desc: 'Soka????n asflat?? olmas?? veya yap??m??n??n iyi olmas??na g??re puan veriniz? ??ok iyi 5 / ??ok k??t?? 0  '),
                                    SizedBox(
                                      height: 40,
                                    ),
                                  ],
                                )
                          ),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        viewModel.sendButton(place,context);
                      },
                      icon: Icon(Icons.check),
                      backgroundColor: Color(0xff2680ea),
                      focusColor: Colors.grey,
                      label: Text('G??nder'),
                      elevation: 10,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  spinBoxWidget(String text, {required Function(int value) onChange, required String desc, double? max, IconData? icon}) {
    return Column(
      children: [
        ExpandablePanel(
          header: Row(
            children: [
              Icon(
                icon ?? Icons.home,
                color: Colors.grey,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                text,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ],
          ),
          expanded: SpinBox(
            min: 0,
            max: max ?? 100,
            step: max == null
                ? 1
                : max > 1000
                    ? 100
                    : 1,
            value: 0,
            onChanged: (value) => onChange(value.toInt()),
          ),
          collapsed: Text(desc),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
