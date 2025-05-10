import 'package:flutter/material.dart';
import 'package:mini_shopping_app/utils/color.dart';
import 'package:mini_shopping_app/utils/text_util.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
    required this.sH,
    required this.sW,
  });
  final String title;
  final Function()? onPressed;
  final double sH;
  final double sW;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sW,
      height: sH * 0.07,
      decoration: BoxDecoration(
        color: AppColors.primaryButtonColor,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Center(
        child: txt(
          "Add to Cart",
          color: AppColors.whiteContainer,
          size: 20,
          weight: FontWeight.w500,
        ),
      ),
    );
  }
}
