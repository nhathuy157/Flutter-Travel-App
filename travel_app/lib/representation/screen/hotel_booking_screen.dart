import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dismension_constant.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representation/screen/guest_and_room_booking_screen.dart';
import 'package:travel_app/representation/screen/select_date_screen.dart';
import 'package:travel_app/representation/widget/app_bar_container.dart';
import 'package:travel_app/representation/widget/button_widget.dart';
import 'package:travel_app/representation/widget/item_booking_widget.dart';
import 'package:travel_app/core/extensions/date_ext.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({Key? key}) : super(key: key);

  static const String routeName = '/hotel_booking_screen';

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  String? dateSelected;
  String? guestAndRoom;
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Hotel booking',
      implementLeading: true,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: kMediumPadding * 2,
            ),
            ItemBookingWidget(
              icon: AssetHelper.iconLocation,
              subTitle: 'Destination',
              title: 'South Korea',
              onTap: (() {}),
            ),
            SizedBox(
              height: kMediumPadding,
            ),
            StatefulBuilder(builder: (context, setState) {
              return ItemBookingWidget(
                icon: AssetHelper.iconDate,
                subTitle: dateSelected ?? '13 Feb - 18 Feb 2021',
                title: 'Select Date',
                onTap: (() async {
                  final result = await Navigator.of(context)
                      .pushNamed(SelectDateScreen.routeName);
                  if (!(result as List<DateTime?>)
                      .any((element) => element == null)) {
                    dateSelected =
                        '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                    setState(
                      () {},
                    );
                  }
                }),
              );
            }),
            SizedBox(
              height: kMediumPadding,
            ),
            ItemBookingWidget(
              icon: AssetHelper.iconRoom,
              subTitle: guestAndRoom ?? 'Guest and Room',
              title: 'Guest and Room',
              onTap: () async {
                final result = await Navigator.of(context).pushNamed(GuestAndRoomScreen.routeName);
                if (result is List<int>) {
                  setState(() {
                    guestAndRoom = '${result[0]} Guest, ${result[1]} Room';
                  });
                }
              },
            ),
            SizedBox(
              height: kMediumPadding,
            ),
            ButtonWidget(
              title: 'Search',
              ontap: (() {}),
            )
          ],
        ),
      ),
    );
  }
}
