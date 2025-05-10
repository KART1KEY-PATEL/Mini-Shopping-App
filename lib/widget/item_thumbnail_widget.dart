import 'package:flutter/material.dart';
import 'package:mini_shopping_app/utils/color.dart';
import 'package:mini_shopping_app/utils/text_util.dart';

class ItemThumbnailWidget extends StatelessWidget {
  const ItemThumbnailWidget({super.key, required this.sH, required this.sW});

  final double sH;
  final double sW;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sH * 0.45,
      width: sW * 0.45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: sH * 0.25,
                width: sW * 0.45,
                decoration: BoxDecoration(
                  color: AppColors.secondaryButtonColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          SizedBox(height: sH * 0.02),
          txt(
            "Nike Sportswear tumhari maa ki chut",
            weight: FontWeight.w400,
            size: sH * 0.018,
          ),
          txt("₹ 9999", weight: FontWeight.w600, size: sH * 0.02),
        ],
      ),
    );
  }
}
