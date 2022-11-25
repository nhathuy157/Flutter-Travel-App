import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constants/dismension_constant.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';

class DetailHotelScreen extends StatefulWidget {
  const DetailHotelScreen({Key? key}) : super(key: key);

  static const String routeName = '/detail_hotel_screen';

  @override
  State<DetailHotelScreen> createState() => _DetailHotelScreenState();
}

class _DetailHotelScreenState extends State<DetailHotelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Positioned.fill(
          child: ImageHelper.loadFromAsset(
            AssetHelper.hotelDetails,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: kMediumPadding * 3,
          left: kMediumPadding,
            child: GestureDetector(
          onTap: (() {}),
          child: Container(
            padding: EdgeInsets.all(kItemPadding),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding))),
                child: Icon(
                  FontAwesomeIcons.arrowLeft,
                  size: 18,
                  color: Colors.grey,
                ),
          ),
        )),
        Positioned(
           top: kMediumPadding * 3,
          right: kMediumPadding,
            child: GestureDetector(
          onTap: (() {}),
          child: Container(
            padding: EdgeInsets.all(kItemPadding),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding))),
                child: Icon(
                  FontAwesomeIcons.heart,
                  size: 18,
                  color: Colors.grey,
                ),
          ),
        )),
        DraggableScrollableSheet(
          initialChildSize: 0.3,
          maxChildSize: 0.8,
          minChildSize: 0.3,
          builder: (context, scrollController) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 2),
                    topRight: Radius.circular(kDefaultPadding * 2),
                  )),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: kDefaultPadding,
                    ),
                    child: Container(
                      height: 5,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(kItemPadding)),
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Expanded(
                      child: ListView(
                    controller: scrollController,
                  ))
                ],
              ),
            );
          },
        ),
      ]),
    );
  }
}
