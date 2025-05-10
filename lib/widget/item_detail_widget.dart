import 'package:flutter/material.dart';
import 'package:mini_shopping_app/models/product_model.dart';
import 'package:mini_shopping_app/utils/color.dart';
import 'package:mini_shopping_app/utils/custom_button.dart';
import 'package:mini_shopping_app/utils/text_util.dart';
import 'package:mini_shopping_app/widget/size_button_widget.dart';

class ItemDetailWidget extends StatelessWidget {
  const ItemDetailWidget({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;
    return Container(
      color: AppColors.primaryColor,
      height: sH * 0.45,
      // color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                txt(
                  "${product.smallDescription}",
                  size: 16,
                  weight: FontWeight.w400,
                  color: AppColors.secondaryTextColor,
                ),
                txt(
                  "Price",
                  size: 16,
                  weight: FontWeight.w400,
                  color: AppColors.secondaryTextColor,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                txt("${product.name}", size: 22, weight: FontWeight.w600),
                txt(
                  product.price.toString(),
                  size: 22,
                  weight: FontWeight.w600,
                ),
              ],
            ),
            txt("Size", size: 18, weight: FontWeight.w600),
            SizedBox(
              height: sH * 0.072,
              width: sW * 0.9,
              child: SizeButtonWidget(sizes: product.sizes),
            ),
            SizedBox(height: sH * 0.02),
            txt("Description", size: 18, weight: FontWeight.w600),
            txt(
              "${product.longDescription}",
              size: 16,
              weight: FontWeight.w400,
            ),
            SizedBox(height: sH * 0.02),
            CustomButton(
              title: "Add to Cart",
              onPressed: () {},
              sH: sH,
              sW: sW,
            ),
          ],
        ),
      ),
    );
  }
}
