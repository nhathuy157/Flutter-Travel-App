import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constants/dismension_constant.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/data/models/hotel_models.dart';
import 'package:travel_app/representation/screen/room_screen.dart';
import 'package:travel_app/representation/widget/button_widget.dart';
import 'package:travel_app/representation/widget/dashline_widget.dart';
import 'package:travel_app/representation/widget/item_utility_hotel_widget.dart';

import '../../core/constants/textstyle_constaints.dart';

class DetailHotelScreen extends StatefulWidget {
  const DetailHotelScreen({Key? key, required this.hotelModel})
      : super(key: key);

  static const String routeName = '/detail_hotel_screen';

  final HotelModel hotelModel;

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
                    borderRadius:
                        BorderRadius.all(Radius.circular(kDefaultPadding))),
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
                    borderRadius:
                        BorderRadius.all(Radius.circular(kDefaultPadding))),
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
                      padding: EdgeInsets.zero,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.hotelModel.hotelName,
                                  style:
                                      TextStyles.defaultStyle.fontHeader.bold,
                                ),
                                Spacer(),
                                Text(
                                  '\$${widget.hotelModel.price.toString()}',
                                  style:
                                      TextStyles.defaultStyle.fontHeader.bold,
                                ),
                                Text(
                                  ' /night',
                                  style: TextStyles.defaultStyle.fontCaption,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: kDefaultPadding,
                            ),
                            Row(
                              children: [
                                ImageHelper.loadFromAsset(
                                  AssetHelper.iconLocationHotel,
                                ),
                                SizedBox(
                                  width: kMinPadding,
                                ),
                                Text(
                                  widget.hotelModel.location,
                                ),
                                Text(
                                  ' - ${widget.hotelModel.awayKilometer} from destination',
                                  style: TextStyles.defaultStyle
                                      .subTitleTextColor.fontCaption,
                                ),
                              ],
                            ),
                            DashLineWidget(),
                            Row(
                              children: [
                                ImageHelper.loadFromAsset(
                                  AssetHelper.iconStar,
                                ),
                                SizedBox(
                                  width: kMinPadding,
                                ),
                                Text(
                                  widget.hotelModel.star.toString(),
                                ),
                                Text(
                                  ' (${widget.hotelModel.numberOfRevice} reviews)',
                                  style:
                                      TextStyles.defaultStyle.subTitleTextColor,
                                ),
                                Spacer(),
                                Text(
                                  'See All',
                                  style: TextStyles
                                      .defaultStyle.bold.primaryTextColor,
                                ),
                              ],
                            ),
                            DashLineWidget(),
                            Text(
                              'Infomation',
                              style: TextStyles.defaultStyle.bold,
                            ),
                            SizedBox(
                              height: kDefaultPadding,
                            ),
                            Text(
                              '''You will find every comfort because many of the services that the hotel offers for travellers and of course the hotel is very comfortable.''',
                            ),
                            ItemUtilyHotelWidget(),
                            SizedBox(
                              height: kDefaultPadding,
                            ),
                            Text(
                              'Location',
                              style: TextStyles.defaultStyle.bold,
                            ),
                            SizedBox(
                              height: kDefaultPadding,
                            ),
                            Text(
                              '''Located in the famous neighborhood of Seoul, Grand Luxury’s is set in a building built in the 2010s.''',
                            ),
                            SizedBox(
                              height: kDefaultPadding,
                            ),
                            ImageHelper.loadFromAsset(
                              AssetHelper.imageMap,
                              width: double.infinity,
                            ),
                            SizedBox(
                              height: kMediumPadding,
                            ),
                            ButtonWidget(
                                title: 'Select Room',
                                ontap: () {
                                  Navigator.of(context).pushNamed(RoomsScreen.routeName);
                                }),
                            SizedBox(
                              height: kMediumPadding,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ]),
    );
  }
}
