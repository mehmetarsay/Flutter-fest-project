import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';
import 'package:zam/core/constant/app/app_constants.dart';
import 'package:zam/core/extension/context_extension.dart';
import 'package:zam/screens/data_add/data_add_view_model.dart';
import 'package:zam/screens/data_add/subviews/bottom_sheet/bottom_sheet_view.dart';
import 'package:zam/screens/map/map_style.dart';
import 'package:zam/widgets/custom_app_bar.dart';
import 'package:zam/widgets/custom_text.dart';
import 'package:zam/widgets/custom_text_form_field.dart';

class DataAddView extends StatelessWidget {
  const DataAddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DataAddViewModel>.reactive(
        viewModelBuilder: () => DataAddViewModel(),
        onModelReady: (viewModel) => viewModel.init(context),
        builder: (context, viewModel, child) {
          return Scaffold(
              appBar: CustomAppBar(
                titleText: 'Değerlendirme Ekleyin',
                titleColor: context.themeData.colorScheme.secondary,
              ),
              // extendBody: true,
              // extendBodyBehindAppBar: true,
              resizeToAvoidBottomInset: false,
              body: viewModel.initialised
                  ? mapAndSearchWidget(viewModel)
                  : const Center(
                      child: CircularProgressIndicator(),
                    ));
        });
  }

  Stack mapAndSearchWidget(DataAddViewModel viewModel) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: ApplicationConstants.kGooglePlex,
          markers: viewModel.markers,
          myLocationButtonEnabled: false,
          onMapCreated: (GoogleMapController controller) {
            viewModel.controller = controller;
            controller.setMapStyle(MapStyle().retro);
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: const [
                Icon(Icons.campaign, color: Colors.red),
                SizedBox(width: 10),
                Expanded(
                    child: CustomText(
                  'Değerlendirme eklemek için sokak/cadde ismi ile apartman numarası giriniz. Listelemeden ilgili adresi seçiniz.',
                  color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold,
                ))
              ],
            ),
          ),
        ),
        Positioned(
          top: 35,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFormField(
                    controller: viewModel.searchController,
                    fillColor: Colors.white,
                    hintText: 'Sokak veya Apartman arayın',
                    onChange: (val) {
                      viewModel.getPlaces();
                    },
                    onTap: () {},
                    isSuffixIcon: GestureDetector(
                        onTap: () {
                          viewModel.getPlaces();
                        },
                        child: Icon(Icons.search)),
                    insideHint: true),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: viewModel.places.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          viewModel.onTap(index);
                        },
                        child: Container(
                          height: 50,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Text('${viewModel.places[index].description}'),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ],
    );
  }
}
