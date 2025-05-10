import 'package:flutter/material.dart';
import 'package:mini_shopping_app/utils/color.dart';
import 'package:mini_shopping_app/utils/text_util.dart';

class CartOrderInfoItems extends StatelessWidget {
  const CartOrderInfoItems({
    super.key,
    required this.title,
    required this.price,
  });
  final String title;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        txt(title, size: 18, color: AppColors.secondaryTextColor),
        txt("₹ ${price}", size: 18, color: AppColors.secondaryTextColor),
      ],
    );
  }
}
