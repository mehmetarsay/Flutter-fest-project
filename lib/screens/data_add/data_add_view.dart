import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';
import 'package:zam/core/constant/app/app_constants.dart';
import 'package:zam/screens/data_add/data_add_view_model.dart';
import 'package:zam/screens/home/help/address_search.dart';
import 'package:zam/screens/home/help/place.dart';
import 'package:zam/screens/map/widget/map_style.dart';
import 'package:zam/widgets/custom_text_form_field.dart';

class DataAddView extends StatelessWidget {
  const DataAddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DataAddViewModel>.reactive(
        viewModelBuilder: () => DataAddViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: ApplicationConstants.kGooglePlex,
                  markers: viewModel.markers,
                  myLocationButtonEnabled: false,
                  onMapCreated: (GoogleMapController controller) {
                    viewModel.controller = controller;
                    controller.setMapStyle(MapStyle().aubergine);
                  },
                ),
                Positioned(
                  top: 50,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextFormField(
                            controller: viewModel.searchController,
                            fillColor: Colors.white,
                            hintText: 'Arama yapın',
                            isSuffixIcon: GestureDetector(
                                onTap:(){

                                },
                                child: Icon(Icons.send)),
                            insideHint: true),
                      ),
                      Container(
                        height: 200,
                        child: ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: viewModel.places.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 50,
                                color:Colors.white,
                                child: Center(child: Text('Entry ${viewModel.places[index].street}')),
                              );
                            }),
                      )
                    ],
                  ),

                  /*Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white
                    ),
                    child: TextField(
                      controller: viewModel.searchController,
                      readOnly: true,
                      onTap: () async {
                        // generate a new token here
                        final sessionToken = Uuid().v4();
                        final Suggestion? result = await showSearch(
                          context: context,
                          delegate: AddressSearch(sessionToken),
                        );
                        // This will change the text displayed in the TextField
                        if (result != null) {
                          final placeDetails = await PlaceApiProvider(sessionToken)
                              .getPlaceDetailFromId(result.placeId);

                        }
                      },
                      decoration: InputDecoration(
                        icon: Container(
                          width: 10,
                          height: 10,
                          child: const Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Enter your shipping address",
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Colors.black
                        ),
                        contentPadding: EdgeInsets.only(left: 8.0, top: 16.0),
                      ),
                    ),
                  ),*/
                ),

              ],
            ),
          );
        });
  }
}
