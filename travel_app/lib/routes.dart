


import 'package:flutter/material.dart';
import 'package:travel_app/data/models/hotel_models.dart';
import 'package:travel_app/representation/screen/detail_hotel_screen.dart';
import 'package:travel_app/representation/screen/guest_and_room_booking_screen.dart';
import 'package:travel_app/representation/screen/hotel_booking_screen.dart';
import 'package:travel_app/representation/screen/hotel_screen.dart';
import 'package:travel_app/representation/screen/intro_screen.dart';
import 'package:travel_app/representation/screen/main_app.dart';
import 'package:travel_app/representation/screen/room_screen.dart';
import 'package:travel_app/representation/screen/select_date_screen.dart';
import 'package:travel_app/representation/screen/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName:(context) => const SplashScreen(),
  IntroScreen.routeName:(context) => const IntroScreen(),
  MainApp.routeName:(context) => const MainApp(),
  HotelScreen.routeName:(context) => HotelScreen(),
  HotelBookingScreen.routeName:(context) => const HotelBookingScreen(),
  SelectDateScreen.routeName:(context) => SelectDateScreen(),
  GuestAndRoomScreen.routeName:(context) => GuestAndRoomScreen(),
  RoomsScreen.routeName:(context) => RoomsScreen(),
//  DetailHotelScreen.routeName:(context) => DetailHotelScreen()


  
};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case DetailHotelScreen.routeName:
      final HotelModel hotelModel = (settings.arguments as HotelModel);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => DetailHotelScreen(
          hotelModel: hotelModel,
        ),
      );
      
  }
  return null;
}
