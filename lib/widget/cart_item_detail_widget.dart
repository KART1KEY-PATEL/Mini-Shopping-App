import 'package:flutter/material.dart';
import 'package:mini_shopping_app/utils/color.dart';
import 'package:mini_shopping_app/utils/text_util.dart';

class CartItemDetailWidget extends StatelessWidget {
  const CartItemDetailWidget({super.key, required this.sW, required this.sH});

  final double sW;
  final double sH;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: sW * 0.28,
          height: sH * 0.15,
          decoration: BoxDecoration(
            color: AppColors.secondaryButtonColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(width: sW * 0.05),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            txt("Product Name", size: 18, weight: FontWeight.w500),
            txt(
              "Pirce + Tax",
              size: 18,
              weight: FontWeight.w500,
              color: AppColors.secondaryTextColor,
            ),
            SizedBox(height: sH * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        // color: Colors.amber,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.borderButtonColor,
                          width: 1,
                        ),
                      ),
                      padding: EdgeInsets.all(2),
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.borderButtonColor,
                      ),
                    ),
                    SizedBox(width: sW * 0.02),

                    txt("1", size: 18, weight: FontWeight.w500),
                    SizedBox(width: sW * 0.02),
                    Container(
                      decoration: BoxDecoration(
                        // color: Colors.amber,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.borderButtonColor,
                          width: 1,
                        ),
                      ),
                      padding: EdgeInsets.all(2),
                      child: Icon(
                        Icons.keyboard_arrow_up_rounded,
                        color: AppColors.borderButtonColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: sW * 0.26),
                Container(
                  decoration: BoxDecoration(
                    // color: Colors.amber,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.borderButtonColor,
                      width: 1,
                    ),
                  ),
                  padding: EdgeInsets.all(2),
                  child: Icon(
                    Icons.delete_outline,
                    color: AppColors.borderButtonColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
