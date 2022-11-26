import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dismension_constant.dart';
import 'package:travel_app/core/helpers/image_helper.dart';

import '../../core/helpers/asset_helper.dart';

class ItemUtilyHotelWidget extends StatelessWidget {
  const ItemUtilyHotelWidget({Key? key}) : super(key: key);

  static const List<Map<String, String>> listUtilityHotel = [
    {'icon': AssetHelper.iconBreakfast, 'name': 'Restaurant'},
    {'icon': AssetHelper.iconWifi, 'name': 'Wifi'},
    {'icon': AssetHelper.iconExchange, 'name': 'Currency-\nExchange'},
    {'icon': AssetHelper.iconDesk, 'name': '24-hour\nFront Desk'},
    {'icon': AssetHelper.iconMore, 'name': 'More'},
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
