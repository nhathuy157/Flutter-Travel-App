import 'package:flutter/material.dart';
import 'package:travel_app/representation/widget/button_widget.dart';

import '../../core/constants/dismension_constant.dart';
import '../../core/helpers/asset_helper.dart';
import '../widget/app_bar_container.dart';
import '../widget/item_add_guest_and_room.dart';


class GuestAndRoomScreen extends StatefulWidget {
  const GuestAndRoomScreen({Key? key}) : super(key: key);

  static const String routeName = '/guest_and_room_booking_screen';

  @override
  State<GuestAndRoomScreen> createState() => _GuestAndRoomScreenState();
}

class _GuestAndRoomScreenState extends State<GuestAndRoomScreen> {
  final GlobalKey<ItemChangeGuestAndRoomState> _itemCountGuest = GlobalKey<ItemChangeGuestAndRoomState>();
  final GlobalKey<ItemChangeGuestAndRoomState> _itemCountRoom = GlobalKey<ItemChangeGuestAndRoomState>();

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Add guest and room',
    //  padding: EdgeInsets.all(kMediumPadding),
      child: Column(
        children: [
          SizedBox(
            height: kMediumPadding,
          ),
          ItemChangeGuestAndRoom(
            key: _itemCountGuest,
            initData: 1,
            icon: AssetHelper.iconPeople,
            value: 'Guest',
          ),
          ItemChangeGuestAndRoom(
            key: _itemCountRoom,
            initData: 1,
            icon: AssetHelper.iconRooms,
            value: 'Room',
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          ButtonWidget(
            title: 'Done',
            ontap: () {
              Navigator.of(context).pop([
                _itemCountGuest.currentState!.number,
                _itemCountRoom.currentState!.number,
              ]);
            },
          ),
        ],
      ),
    );
  }
}