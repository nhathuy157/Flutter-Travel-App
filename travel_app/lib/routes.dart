import 'package:flutter/material.dart';
import 'package:travel_app/data/models/hotel_models.dart';
import 'package:travel_app/representation/screen/check_out_screen.dart';
import 'package:travel_app/representation/screen/detail_hotel_screen.dart';
import 'package:travel_app/representation/screen/guest_and_room_booking_screen.dart';
import 'package:travel_app/representation/screen/hotel_booking_screen.dart';
import 'package:travel_app/representation/screen/hotel_screen.dart';
import 'package:travel_app/representation/screen/intro_screen.dart';
import 'package:travel_app/representation/screen/main_app.dart';
import 'package:travel_app/representation/screen/room_screen.dart';
import 'package:travel_app/representation/screen/select_date_screen.dart';

import 'data/models/room_model.dart';


final Map<String, WidgetBuilder> routes = {
  IntroScreen.routeName: (context) => const IntroScreen(),
  MainApp.routeName: (context) => MainApp(),
  HotelScreen.routeName: (context) => HotelScreen(),
  SelectDateScreen.routeName: (context) => SelectDateScreen(),
  GuestAndRoomScreen.routeName: (context) => GuestAndRoomScreen(),
  RoomsScreen.routeName: (context) => RoomsScreen(),
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
    case CheckOutScreen.routeName:
      final RoomModel roomModel = (settings.arguments as RoomModel);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => CheckOutScreen(
          roomModel: roomModel,
        ),
      );

    case HotelBookingScreen.routeName:
      final String? destination = (settings.arguments as String?);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => HotelBookingScreen(
          destination: destination.toString(),
        ),
      );
    default:
      return null;
  }
}