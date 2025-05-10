import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_shopping_app/utils/color.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({
    super.key,
    required this.iconAsset,
    this.reverseColor = false,
    required this.onPressed,
  });
  final VoidCallback onPressed; // Changed from Function to VoidCallback
  final String iconAsset;
  final bool reverseColor;

  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        // height: sH * 0.05,
        // width: sW * 0.13,
        padding: EdgeInsets.all(sW * 0.03),
        decoration: BoxDecoration(
          color:
              reverseColor
                  ? AppColors.primaryColor
                  : AppColors.secondaryButtonColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(iconAsset, height: 30, width: 30),
        ),
      ),
    );
  }
}
