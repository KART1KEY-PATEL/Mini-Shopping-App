import 'package:flutter/material.dart';
import 'package:mini_shopping_app/models/cart_item_model.dart';
import 'package:mini_shopping_app/utils/color.dart';
import 'package:mini_shopping_app/widget/cart_item_detail_widget.dart';

class CartItemListWidget extends StatelessWidget {
  const CartItemListWidget({
    super.key,
    required this.sH,
    required this.sW,
    required this.cartItem,
  });

  final double sH;
  final double sW;
  final List<CartItem> cartItem;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          height: sH * 0.15,
          width: sW,
          decoration: BoxDecoration(
            color: AppColors.cartItemColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryTextColor.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          padding: EdgeInsets.all(10),
          child: CartItemDetailWidget(
            sW: sW,
            sH: sH,
            cartItem: cartItem[index],
          ),
        );
      },
      separatorBuilder: (contex, index) {
        return SizedBox(height: sH * 0.02);
      },
      itemCount: cartItem.length,
    );
  }
}
