import 'package:flutter/material.dart';
import 'package:travel_app/representation/screen/detail_hotel_screen.dart';
import 'package:travel_app/representation/widget/app_bar_container.dart';

import '../../core/helpers/asset_helper.dart';
import '../../data/models/hotel_models.dart';
import '../widget/item_hotel_widget.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({Key? key}) : super(key: key);

  static const String routeName = '/hotel_screen';

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  
  @override
  Widget build(BuildContext context) {
    final List<HotelModel> listHotel = [
    HotelModel(
      hotelImage: AssetHelper.hotel1,
      hotelName: 'Royal Palm Heritage',
      location: 'Purwokerto, Jateng',
      awayKilometer: '364 m',
      star: 4.5,
      numberOfRevice: 3241,
      price: 143,
    ),
    HotelModel(
      hotelImage: AssetHelper.hotel2,
      hotelName: 'Grand Luxury\'s',
      location: 'Banyumas, Jateng',
      awayKilometer: '2.3 km',
      star: 4.2,
      numberOfRevice: 3241,
      price: 234,
    ),
    HotelModel(
      hotelImage: AssetHelper.hotel3,
      hotelName: 'The Orlando House',
      location: 'Ajibarang, Jateng',
      awayKilometer: '1.1 km',
      star: 3.8,
      numberOfRevice: 1234,
      price: 132,
    ),
  ];
    
    return AppBarContainer(
        implementLeading: true,
        titleString: 'Hotels',
        child: SingleChildScrollView(
          child: Column(
            children: listHotel
                .map(
                  (e) => ItemHotelWidget(
                    hotelModel: e,
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(DetailHotelScreen.routeName, arguments: e);
                    },
                  ),
                )
                .toList(),
          ),
        ));
  }
}
