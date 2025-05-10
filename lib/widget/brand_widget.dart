import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_shopping_app/constants/contants.dart';
import 'package:mini_shopping_app/extensions/string_extensions.dart';
import 'package:mini_shopping_app/utils/color.dart';
import 'package:mini_shopping_app/utils/text_util.dart';

class BrandWidget extends StatelessWidget {
  const BrandWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;
    return SizedBox(
      height: sH * 0.05,
      width: sW,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(width: sW * 0.02);
        },
        itemBuilder: (context, index) {
          return Container(
            height: sH * 0.05,
            // width: sW * 0.2,
            color: Colors.amber,
            padding: EdgeInsets.symmetric(horizontal: sW * 0.02),
            child: Center(
              child: Row(
                children: [
                  Container(
                    height: sH * 0.04,
                    color: Colors.white,
                    child: SvgPicture.asset(
                      AppConstants.brands[index]["assets"]!,
                      height: sH * 0.03,
                      width: sW * 0.1,
                      color: AppColors.darkSVGContainer,
                    ),
                  ),
                  SizedBox(width: sW * 0.02),
                  txt(
                    AppConstants.brands[index]["name"]!.toTitleCase(),
                    size: sH * 0.018,
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: AppConstants.brands.length,
      ),
    );
  }
}
