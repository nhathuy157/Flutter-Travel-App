
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/core/constants/color_constants.dart';

import '../../core/constants/dismension_constant.dart';
import '../../core/constants/textstyle_constaints.dart';
import '../../core/helpers/asset_helper.dart';
import '../widget/item_intro_widget.dart';
import 'main_app.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  static String routeName = '/intro_screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  final StreamController<int> _streamController = StreamController<int>();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _streamController.add(_pageController.page!.toInt());
    });
  }

  final List<Widget> listPage = [
    const ItemIntroWidget(
      title: 'Book a flight',
      description: 'Found a flight that matches your destination and schedule? Book it instantly.',
      sourceImage: AssetHelper.intro1,
      aligment: Alignment.centerRight,
    ),
    const ItemIntroWidget(
      title: 'Find a hotel room',
      description: 'Select the day, book your room. We give you the best price.',
      sourceImage: AssetHelper.intro2,
      aligment: Alignment.center,
    ),
    const ItemIntroWidget(
      title: 'Enjoy your trip',
      description: 'Easy discovering new places and share these between your friends and travel together.',
      sourceImage: AssetHelper.intro3,
      aligment: Alignment.centerLeft,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: listPage,
          ),
          Positioned(
            left: kMediumPadding,
            right: kMediumPadding,
            bottom: kMediumPadding * 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    dotWidth: kMinPadding,
                    dotHeight: kMinPadding,
                    activeDotColor: Colors.orange,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_pageController.page == 2) {
                      Navigator.of(context).pushNamed(MainApp.routeName);
                    } else {
                      _pageController.nextPage(duration: Duration(milliseconds: 200), curve: Curves.easeIn);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kMediumPadding),
                      gradient: Gradients.defualtGradientBg
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: kMediumPadding * 2, vertical: kDefaultPadding),
                    child: StreamBuilder<int>(
                      initialData: 0,
                      stream: _streamController.stream,
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data != 2 ? 'Next' : 'Get Started',
                          style: TextStyles.defaultStyle.whiteTextColor.bold,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}