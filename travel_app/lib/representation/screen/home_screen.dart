import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:travel_app/core/constants/dismension_constant.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representation/screen/hotel_booking_screen.dart';
import 'package:travel_app/representation/widget/app_bar_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _builtItemCategory(
      Widget icon, Color color, Function() ontap, String title) {
    return GestureDetector(
        onTap: ontap,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: kMediumPadding),
              decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(kItemPadding)),
              child: icon,
            ),
            SizedBox(
              height: kItemPadding,
            ),
            Text(title)
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Hi Jame!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                Text(
                  'Where are you going next?',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
            Spacer(),
            Icon(
              FontAwesomeIcons.bell,
              size: kDefaultIconSize,
              color: Colors.white,
            ),
            SizedBox(
              width: kTopPadding,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(kItemPadding)),
              padding: EdgeInsets.all(kMinPadding),
              child: ImageHelper.loadFromAsset(AssetHelper.avatar),
            ),
          ],
        ),
      ),
      child: Column(
        children: [
          TextField(
            enabled: true,
            autocorrect: false,
            decoration: InputDecoration(
              hintText: 'Search your destination',
              prefixIcon: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.black,
                  size: 14,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    kItemPadding,
                  ),
                ),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: kItemPadding),
            ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Row(
            children: [
              Expanded(
                  child: _builtItemCategory(
                      ImageHelper.loadFromAsset(AssetHelper.iconHotel,
                          width: kBottomBarIconSize, height: kBottomBarIconSize),
                      Color(0xffFE9C5E),
                      () {
                        Navigator.of(context).pushNamed(HotelBookingScreen.routeName);
                      },
                      'Hotels')),
              SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(
                  child: _builtItemCategory(
                      ImageHelper.loadFromAsset(AssetHelper.iconPlane,
                          width: kBottomBarIconSize, height: kBottomBarIconSize),
                      Color(0xffF77777),
                      () {},
                      'Fligths')),
              SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(
                  child: _builtItemCategory(
                      ImageHelper.loadFromAsset(AssetHelper.iconHotelPlane,
                          width: kBottomBarIconSize, height: kBottomBarIconSize),
                      // ignore: use_full_hex_values_for_flutter_colors
                      Color(0xfff3ec8bc),
                      () {},
                      'All')),
            ],
          )
        ],
      ),
    );
  }
}
