import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:stacked/stacked.dart';
import 'package:zam/model/detail_report.dart';
import 'package:zam/model/place.dart';
import 'package:zam/screens/home/subviews/expandable/expandable_view_model.dart';

class HomeBottomSheet extends StatelessWidget {
  const HomeBottomSheet({Key? key, required this.place,required this.detailReport}) : super(key: key);
  final Place place;
  final DetailReport detailReport;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeBottomSheetViewModel>.reactive(
        viewModelBuilder: () => HomeBottomSheetViewModel(),
        builder: (context, viewModel, child) {
          return Container(
            constraints: BoxConstraints(
              maxHeight: 600,
            ),
            color: Colors.white,
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
                              child: Column(
                                children: [
                                  CircularPercentIndicator(
                                    radius: 60.0,
                                    lineWidth: 15.0,
                                    percent: 3/5,
                                    center: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                         Text("3/5",style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                        Text('Puan')
                                      ],
                                    ),
                                    progressColor: Colors.green,
                                    backgroundColor: Colors.grey,
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(height: 20,),
                                      linearBarWidgets('Bina yaşı',desc: '',percent: listMeanMethod(detailReport.buildingAge)/40,total: '${listMeanMethod(detailReport.buildingAge)}/40',icon: Icons.home),
                                      linearBarWidgets('Su Kalitesi',desc: '',percent: listMeanMethod(detailReport.waterQuality)/5,total: '${listMeanMethod(detailReport.waterQuality)}/5',icon: Icons.water),
                                      linearBarWidgets('Kira Ücreti',desc: '',percent: listMeanMethod(detailReport.rentMoney)/10000,total: '${listMeanMethod(detailReport.rentMoney)}/10000',icon: Icons.money),
                                      linearBarWidgets('Tesisat Kalitesi',desc: '',percent: listMeanMethod(detailReport.plumbingQuality)/5,total: '${listMeanMethod(detailReport.plumbingQuality)}/5',icon: Icons.wrap_text),
                                      linearBarWidgets('internet Kalitesi',desc: '',percent: listMeanMethod(detailReport.internetQuality)/5,total: '${ listMeanMethod(detailReport.internetQuality)}/5',icon: Icons.network_check),
                                      linearBarWidgets('Elektirik Kalitesi',desc: '',percent: listMeanMethod(detailReport.electricityQuality)/5,total: '${listMeanMethod(detailReport.electricityQuality)}/5',icon: Icons.whatshot),
                                      linearBarWidgets('Dayanıklılık',desc: '',percent: listMeanMethod(detailReport.durability)/5,total: '${listMeanMethod(detailReport.durability)}/5',icon: Icons.spellcheck),




                                    ],
                                  ),
                                ],
                              )),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }


  linearBarWidgets(String text, { required String desc,required double percent,required String total,  IconData? icon}) {
    return Column(
      children: [
        ExpandablePanel(
          controller:ExpandableController(initialExpanded: true),
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
          expanded: Row(
            children: [
              LinearPercentIndicator(
                width: 300,
                lineHeight: 14.0,
                percent: percent.isNaN?0:percent,
                barRadius: Radius.circular(10),
                backgroundColor: Colors.grey,
                progressColor: Colors.redAccent,
              ),
              Text(total)
            ],
          ),
          collapsed: Text(desc),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  listMeanMethod(var list){
    if(list.isEmpty) return 0;
    int number = 0;
    for(int i in list){
      number = number + i;
    }
    return number/list.length;
  }
}
