import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dismension_constant.dart';
import 'package:travel_app/core/helpers/image_helper.dart';

import '../../core/helpers/asset_helper.dart';

class ItemUtilyHotelSelectWidget extends StatelessWidget {
  const ItemUtilyHotelSelectWidget({Key? key}) : super(key: key);

  static const List<Map<String, String>> listUtilityHotel = [
    {'icon': AssetHelper.iconBreakfast, 'name': 'Free \nWiFi'},
    {'icon': AssetHelper.iconWifi, 'name': 'Non-\nRefundable'},
    {'icon': AssetHelper.iconExchange, 'name': 'Free \nBreakfast'},
    {'icon': AssetHelper.iconDesk, 'name': 'Non-\nSmoking'},
    
  ];

  Widget _buildItemUtilityHotelWidget(
      {required String icon, required String name}) {
    return Column(
      children: [
        ImageHelper.loadFromAsset(icon),
        SizedBox(
          height: kTopPadding,
        ),
        Text(
          name,
          textAlign: TextAlign.center,
        )
      ],
    );

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: listUtilityHotel
            .map((e) => _buildItemUtilityHotelWidget(
                icon: e['icon']!, name: e['name']!))
            .toList(),
      ),
    );
  }
}
