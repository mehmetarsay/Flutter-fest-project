import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:stacked/stacked.dart';
import 'package:zam/model/place.dart';
import 'package:zam/screens/data_add/subviews/bottom_sheet/bottom_sheet_view_model.dart';

class HomeBottomSheet extends StatelessWidget {
  const HomeBottomSheet({Key? key, required this.place}) : super(key: key);
  final Place place;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DataAddBottomSheetViewModel>.reactive(
        viewModelBuilder: () => DataAddBottomSheetViewModel(),
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

                              ],
                            )
                          ),
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
