// widgets/brand_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_shopping_app/bloc/brand/brand_bloc.dart';
import 'package:mini_shopping_app/bloc/brand/brand_event.dart';
import 'package:mini_shopping_app/bloc/brand/brand_state.dart';
import 'package:mini_shopping_app/constants/contants.dart';
import 'package:mini_shopping_app/extensions/string_extensions.dart';
import 'package:mini_shopping_app/utils/color.dart';
import 'package:mini_shopping_app/utils/text_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandWidget extends StatelessWidget {
  const BrandWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final brandBloc = BlocProvider.of<BrandBloc>(context);
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;

    return BlocBuilder<BrandBloc, BrandState>(
      builder: (context, state) {
        return SizedBox(
          height: sH * 0.05,
          width: sW,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: sW * 0.02),
            itemCount: AppConstants.brands.length,
            itemBuilder: (context, index) {
              final brand = AppConstants.brands[index]["name"]!;
              final isSelected =
                  state is BrandSelected && state.selectedBrand == brand;

              return GestureDetector(
                onTap: () {
                  if (isSelected) {
                    brandBloc.add(ClearBrandFilter());
                  } else {
                    brandBloc.add(SelectBrand(brand));
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: sW * 0.02),
                  decoration: BoxDecoration(
                    color:
                        isSelected
                            ? AppColors.primaryButtonColor
                            : AppColors.secondaryButtonColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.whiteSVGColor,
                        ),
                        padding: EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          AppConstants.brands[index]["assets"]!,
                          height: sH * 0.02,
                          width: sW * 0.1,
                          color: AppColors.darkSVGContainer,
                        ),
                      ),
                      SizedBox(width: sW * 0.02),
                      txt(
                        brand.toTitleCase(),
                        size: sH * 0.018,
                        // color: isSelected ? AppColors.whiteSVGColor : null,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
