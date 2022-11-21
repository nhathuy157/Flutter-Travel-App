import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/helpers/local_storage_helper.dart';
import 'package:travel_app/representation/screen/splash_screen.dart';
import 'package:travel_app/routes.dart';

void main()async {
  await Hive.initFlutter();
  await LocalSrorageHelper.initLocalStorageHelper();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travo App',
      theme: ThemeData(
        primaryColor: ColorPalette.primaryColor,
        scaffoldBackgroundColor: ColorPalette.bgScaffoldColor,
        backgroundColor: ColorPalette.bgScaffoldColor,
      ),
      routes: routes,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

