import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_shopping_app/utils/color.dart';
import 'package:mini_shopping_app/utils/custom_textfield.dart';

class SearchMicWidget extends StatelessWidget {
  const SearchMicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: sW * 0.73,
          height: sH * 0.0,
          decoration: BoxDecoration(
            color: AppColors.secondaryButtonColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [],
          ),
          child: CustomTextField(
            hintText: "Search",
            controller: TextEditingController(),
            maxLines: 1,
          ),
        ),
        Spacer(),
        Container(
          height: sH * 0.07,
          width: sW * 0.15,
          decoration: BoxDecoration(
            color: AppColors.primaryButtonColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/mic.svg',
              height: 30,
              width: 30,
              color: AppColors.whiteSVGColor,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
