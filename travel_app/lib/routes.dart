
import 'package:flutter/material.dart';
import 'package:travel_app/representation/screen/guest_and_room_booking_screen.dart';
import 'package:travel_app/representation/screen/hotel_booking_screen.dart';
import 'package:travel_app/representation/screen/hotel_screen.dart';
import 'package:travel_app/representation/screen/intro_screen.dart';
import 'package:travel_app/representation/screen/main_app.dart';
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


  
};