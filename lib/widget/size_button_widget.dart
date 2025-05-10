import 'package:flutter/material.dart';
import 'package:mini_shopping_app/utils/color.dart';
import 'package:mini_shopping_app/utils/text_util.dart';

class SizeButtonWidget extends StatelessWidget {
  const SizeButtonWidget({
    super.key,
    required this.sizes,
    required this.selectSize,
    required this.onSizeSelected, // New callback
  });
  final List<String> sizes;
  final int selectSize;
  final Function(int)
  onSizeSelected; // Changed from VoidCallback to Function(int)

  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            onSizeSelected(index); // Pass the selected index
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color:
                  selectSize == index
                      ? AppColors
                          .primaryButtonColor // Highlight selected size
                      : AppColors.secondaryButtonColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: txt(
                sizes[index],
                size: 22,
                weight: FontWeight.w600,
                // color:
                //     selectSize == index
                //         ? AppColors
                //             .whiteSVGColor // Change text color if selected
                //         : null,
              ),
            ),
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
