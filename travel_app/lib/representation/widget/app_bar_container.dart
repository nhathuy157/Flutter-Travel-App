import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dismension_constant.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer(
      {Key? key,
      required this.child,
      this.title,
      this.implementLeading = false,
      this.titleString,
      this.implementTraling = false})
      : super(key: key);

  final Widget child;
  final Widget? title;
  final String? titleString;
  final bool implementLeading;
  final bool implementTraling;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 186,
            child: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 90,
              backgroundColor: ColorPalette.bgScaffoldColor,
              title: title ??
                  Row(
                    children: [
                      if (implementLeading)
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(kDefaultPadding),
                            ),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(kItemPadding),
                          child: Icon(
                            FontAwesomeIcons.arrowLeft,
                            color: Colors.grey,
                            size: kDefaultIconSize,
                          ),
                        ),
                      Expanded(
                          child: Center(
                        child: Column(
                          children: [
                            Text(
                              titleString ?? '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20

                              ),
                            )
                          ],
                        ),
                      )),
                      if(implementTraling)
                       Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(kDefaultPadding),
                            ),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(kItemPadding),
                          child: Icon(
                            FontAwesomeIcons.bars,
                            color: Colors.grey,
                            size: kDefaultIconSize,
                          ),
                        ),
                    ],
                  ),
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        gradient: Gradients.defualtGradientBg,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(35))),
                  ),
                  Positioned(
                      top: 0,
                      left: 0,
                      child: ImageHelper.loadFromAsset(AssetHelper.oval1)),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: ImageHelper.loadFromAsset(AssetHelper.oval2)),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
            margin: EdgeInsets.only(top: 156),
            child: child,
          )
        ],
      ),
    );
  }
}
