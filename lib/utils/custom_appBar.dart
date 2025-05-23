// Custom AppBar Component
import 'package:flutter/material.dart';
import 'package:mini_shopping_app/utils/color.dart';
import 'package:mini_shopping_app/utils/text_util.dart';

PreferredSizeWidget customAppBar({
  required String title,
  List<Widget>? actions,
  Widget? leading,
  Color backgroundColor = AppColors.primaryColor,
  Color titleColor = Colors.white,
  double elevation = 0.0,
  bool centerTitle = false,
  double textSize = 20,
}) {
  return AppBar(
    title: txt(
      title,
      isBold: true,
      size: textSize,
      color: titleColor,
    ),
    automaticallyImplyLeading: leading != null ? true : false,
    backgroundColor: backgroundColor,
    elevation: elevation,
    centerTitle: centerTitle,
    actions: actions,
    leading: leading,
  );
}
