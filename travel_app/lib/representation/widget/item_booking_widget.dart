import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dismension_constant.dart';


class ItemBookingWidget extends StatelessWidget {
  const ItemBookingWidget(
      {Key? key,
      required this.icon,
      required this.subTitle,
      required this.title, this.onTap})
      : super(key: key);

  final String icon;
  final String title;
  final String subTitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(kItemPadding))),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 36,
              height: 36,
            ),
            SizedBox(
              width: kDefaultPadding,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  
                ),
                SizedBox(
                  height: kMinPadding,
                ),
                Text(subTitle,
                style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
