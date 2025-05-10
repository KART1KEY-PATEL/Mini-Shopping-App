import 'package:flutter/material.dart';
import 'package:mini_shopping_app/utils/color.dart';
import 'package:mini_shopping_app/utils/text_util.dart';

class CartPaymentWidget extends StatelessWidget {
  const CartPaymentWidget({super.key, required this.sW, required this.sH});

  final double sW;
  final double sH;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: sW * 0.17,
          height: sH * 0.08,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/payment.png"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        SizedBox(width: sW * 0.02),
        SizedBox(
          width: sW * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              txt("VISA Casic", size: sW * 0.04, weight: FontWeight.w500),
              txt(
                "**** 9999",
                size: sW * 0.04,
                color: AppColors.secondaryTextColor,
              ),
            ],
          ),
        ),
        SizedBox(width: sW * 0.04),
        Container(
          decoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(5),
          child: Center(
            child: Icon(Icons.check, color: AppColors.whiteContainer),
          ),
        ),
      ],
    );
  }
}
