import 'package:flutter/material.dart';


import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representation/screen/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static String routeName = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    redirectIntroScreen();
  }
  void redirectIntroScreen() async {
     await Future.delayed(Duration(milliseconds: 1000));
     Navigator.of(context).pushNamed(IntroScreen.routeName);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ImageHelper.loadFromAsset(AssetHelper.imageBackgroundSplash,
              fit: BoxFit.fitWidth),
        ),
        Positioned.fill(
            child: ImageHelper.loadFromAsset(AssetHelper.imageCircleSplash
            )
          )
      ],
    );
  }
}
