import 'package:flutter/material.dart';
import 'package:mini_shopping_app/extensions/string_extensions.dart';
import 'package:mini_shopping_app/models/product_model.dart';
import 'package:mini_shopping_app/pages/item_page.dart';
import 'package:mini_shopping_app/services/product_service.dart';
import 'package:mini_shopping_app/utils/color.dart';
import 'package:mini_shopping_app/utils/like_button.dart';
import 'package:mini_shopping_app/utils/text_util.dart';

class ItemThumbnailWidget extends StatelessWidget {
  const ItemThumbnailWidget({
    super.key,
    required this.sH,
    required this.sW,
    required this.product,
  });

  final double sH;
  final double sW;
  final Product product;
  void _itemPress(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ItemPage(product: product)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sH * 0.45,
      width: sW * 0.45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () => _itemPress(context),
                child: Container(
                  height: sH * 0.25,
                  width: sW * 0.45,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryButtonColor,
                    borderRadius: BorderRadius.circular(10),

                    image: DecorationImage(
                      image: AssetImage(ProductService().getImagePath(product)),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 5,
                top: 2,
                child: CustomLikeButton(
                  product: product,
                ), // Changed from isLiked: false
              ),
            ],
          ),
          SizedBox(height: sH * 0.02),
          txt(
            product.name.toTitleCase(),
            weight: FontWeight.w400,
            size: sH * 0.018,
          ),
          txt("₹ ${product.price}", weight: FontWeight.w600, size: sH * 0.02),
        ],
      ),
    );
  }
}
