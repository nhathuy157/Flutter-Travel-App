import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:travel_app/core/constants/dismension_constant.dart';
import 'package:travel_app/representation/widget/button_widget.dart';

import '../../core/constants/color_constants.dart';
import '../widget/app_bar_container.dart';

// ignore: must_be_immutable
class SelectDateScreen extends StatelessWidget {
  SelectDateScreen({Key? key}) : super(key: key);

  static const String routeName = 'select_date_screen';

  DateTime? rangeStartDate;
  DateTime? rangeEndDate;

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
        titleString: 'Select date',
        implementLeading: true,
        child: Column(
          children: [
            SizedBox(
              height: kMediumPadding * 1.5,
            ),
            SfDateRangePicker(
              view: DateRangePickerView.month,
              selectionMode: DateRangePickerSelectionMode.range,
              monthViewSettings:
                  DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
              selectionColor: ColorPalette.yellowColor,
              startRangeSelectionColor: ColorPalette.yellowColor,
              endRangeSelectionColor: ColorPalette.yellowColor,
              rangeSelectionColor: ColorPalette.yellowColor.withOpacity(0.25),
              todayHighlightColor: ColorPalette.yellowColor,
              toggleDaySelection: true,
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                if (args.value is PickerDateRange) {
                  rangeStartDate = args.value.startDate;
                  rangeEndDate = args.value.endDate;
                } else {
                  rangeEndDate = null;
                  rangeStartDate = null;
                }
              },
            ),
            ButtonWidget(title: 'Select',
            ontap: (() {
              Navigator.of(context).pop(
                [rangeStartDate, rangeEndDate]
              );
            }),),
            SizedBox(
              height: kDefaultPadding,
            ),
            ButtonWidget(title: 'Cancel',
            ontap: (() {
              Navigator.of(context).pop([null , null ]);
            }),),
          ],
        ));
  }
}
