import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dismension_constant.dart';

import '../../core/constants/color_constants.dart';
import '../../core/constants/textstyle_constaints.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, required this.title, this.ontap})
      : super(key: key);

  final String title;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kMediumPadding),
            gradient: Gradients.defualtGradientBg),
        alignment: Alignment.center,    
        child: Text(
          title,
          style: TextStyles.defaultStyle.bold.whiteTextColor,
        ),
      ),
    );
  }
}
