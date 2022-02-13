import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:stacked/stacked.dart';
import 'package:zam/core/extension/context_extension.dart';
import 'package:zam/widgets/custom_app_bar.dart';

import '../../model/place_data.dart';
import '../../model/place_user_data.dart';
import '../../model/street_user_data.dart';
import '../../widgets/custom_text.dart';
import 'my_collection_view_model.dart';

class MyCollectionView extends StatelessWidget {
  const MyCollectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyCollectionViewModel>.reactive(
        viewModelBuilder: () => MyCollectionViewModel(),
        onModelReady: (viewModel) => viewModel.init(context),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: context.themeData.colorScheme.onSecondary,
            appBar: CustomAppBar(titleText: 'Değerlendirmelerim', titleColor: Colors.red,),
            body: viewModel.isLoading
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          expandableHeader(
                            context,
                            viewModel,
                            title: 'Cadde/Sokak',
                            desc: 'Değerlendirdiğiniz cadde ve sokaklar',
                            iconData: Icons.map,
                            childList: (viewModel.listStreet as List)
                                .map((e) => expandableStreet(
                                    context, e['placeData'],
                                    streetAnalysis: e['data']))
                                .toList(),
                          ),
                          expandableHeader(context, viewModel,
                              title: 'Apartman',
                              desc: 'Değerlendirdiğiniz apartmanlar',
                              iconData: Icons.apartment,
                              childList: (viewModel.listPlace as List)
                                  .map((e) => expandableStreet(
                                      context, e['placeData'],
                                      placeAnalysis: e['data']))
                                  .toList()),
                        ],
                      ),
                    ),
                  ),
          );
        });
  }

  Widget expandableStreet(BuildContext context, PlaceData placeData,
      {PlaceUserData? placeAnalysis, StreetUserData? streetAnalysis}) {
    return Padding(
      padding: const EdgeInsets.only(left: 35),
      child: ExpandablePanel(
        controller: ExpandableController(initialExpanded: true),
        theme: ExpandableThemeData(hasIcon: false),
        header: Container(
          height: context.dynamicHeight(0.07),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CustomText(placeData.title,
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: context.themeData.colorScheme.onPrimary),
          ),
        ),
        expanded: placeAnalysis != null
            ? columnPlaceAnalysis(context, placeAnalysis)
            : streetAnalysis != null
                ? columnStreetAnalysis(context, streetAnalysis)
                : const SizedBox(),
        collapsed: CustomText(''),
      ),
    );
  }

  Column columnStreetAnalysis(
      BuildContext context, StreetUserData streetAnalysis) {
    return Column(
      children: [
        field(context, 'İnternet Kalitesi',
            value: streetAnalysis.internetQuality, icon: Icons.network_check),
        field(context, 'Elektrik Kalitesi',
            value: streetAnalysis.electricityQuality, icon: Icons.whatshot),
        field(context, 'Su Kalitesi',
            value: streetAnalysis.waterQuality, icon: Icons.water),
        field(context, 'İnşa Kalitesi',
            value: streetAnalysis.buildQuality, icon: Icons.apartment_outlined),
        field(context, 'Park Alanı',
            value: streetAnalysis.carPark, icon: Icons.local_parking),
        field(context, 'Koku',
            value: streetAnalysis.smell, icon: Icons.filter_drama),
      ],
    );
  }

  Column columnPlaceAnalysis(
      BuildContext context, PlaceUserData placeAnalysis) {
    return Column(
      children: [
        field(context, 'Bina yaşı',
            value: placeAnalysis.buildingAge, icon: Icons.home),
        field(context, 'Su Kalitesi',
            value: placeAnalysis.waterQuality, icon: Icons.water),
        field(context, 'Kira Ücreti',
            value: placeAnalysis.rentMoney, icon: Icons.money,isCircle: false),
        field(context, 'Tesisat Kalitesi',
            value: placeAnalysis.plumbingQuality, icon: Icons.wrap_text),
        field(context, 'internet Kalitesi',
            value: placeAnalysis.internetQuality, icon: Icons.network_check),
        field(context, 'Elektirik Kalitesi',
            value: placeAnalysis.electricityQuality, icon: Icons.whatshot),
        field(context, 'Dayanıklılık',
            value: placeAnalysis.durability, icon: Icons.spellcheck),
      ],
    );
  }

  Widget field(BuildContext context, String text,
      {required int? value, IconData? icon, bool isCircle = true}) {
    return value != null
        ? Padding(
            padding: const EdgeInsets.only(right: 7, top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      icon ?? Icons.home,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 5),
                    CustomText(
                      text,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ],
                ),
                Container(
                  height: context.dynamicHeight(0.03),
                  width: isCircle ? context.dynamicHeight(0.03) : context.dynamicHeight(0.07),
                  decoration: BoxDecoration(
                      borderRadius: isCircle ? BorderRadius.circular(200) : null,
                      border: Border.all(
                          color: context.themeData.colorScheme.secondary)),
                  child: Center(
                    child: CustomText(value.toString(),
                        color: context.themeData.colorScheme.secondary,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )
        : SizedBox();
  }

  // listMeanMethod(var list){
  //   if(list == null || list.isEmpty) return 0;
  //   int number = 0;
  //   for(int i in list){
  //     number = number + i;
  //   }
  //   return number/list.length;
  // }

  Widget expandableHeader(BuildContext context, MyCollectionViewModel viewModel,
      {required String title,
      required String desc,
      IconData? iconData,
      required List<Widget> childList}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: ExpandablePanel(
        controller: ExpandableController(initialExpanded: true),
        theme: ExpandableThemeData(
            iconColor: context.themeData.colorScheme.primary),
        header: Container(
          height: context.dynamicHeight(0.07),
          child: Row(
            children: [
              Icon(iconData ?? Icons.map,
                  color: context.themeData.colorScheme.primary),
              SizedBox(width: 10),
              CustomText(title,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: context.themeData.colorScheme.primary),
            ],
          ),
        ),
        expanded: Column(
          children: childList,
        ),
        collapsed: CustomText(desc,
            color: context.themeData.colorScheme.primary.withOpacity(0.5)),
      ),
    );
  }
}
