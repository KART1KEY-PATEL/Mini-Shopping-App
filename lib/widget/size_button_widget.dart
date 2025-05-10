import 'package:flutter/material.dart';
import 'package:mini_shopping_app/utils/color.dart';
import 'package:mini_shopping_app/utils/text_util.dart';

class SizeButtonWidget extends StatelessWidget {
  const SizeButtonWidget({super.key, required this.sizes});
  final List<String> sizes;

  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.only(left: 25, right: 25),
          decoration: BoxDecoration(
            color: AppColors.secondaryButtonColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: txt("${sizes[index]}", size: 22, weight: FontWeight.w600),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: sW * 0.03);
      },
      itemCount: sizes.length,
    );
  }
}
