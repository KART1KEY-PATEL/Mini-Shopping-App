import 'package:flutter/material.dart';
import 'package:mini_shopping_app/utils/color.dart';
import 'package:mini_shopping_app/utils/text_util.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;
    return Row(
      children: [
        txt(categoryName, weight: FontWeight.w500, size: sH * 0.024),
        Spacer(),
        txt("View All", size: sH * 0.02, color: AppColors.secondaryTextColor),
      ],
    );
  }
}
