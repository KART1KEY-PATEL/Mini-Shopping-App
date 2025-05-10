import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shopping_app/bloc/cart/cart_bloc.dart';
import 'package:mini_shopping_app/bloc/cart/cart_event.dart';
import 'package:mini_shopping_app/models/cart_item_model.dart';
import 'package:mini_shopping_app/utils/color.dart';
import 'package:mini_shopping_app/utils/text_util.dart';

class CartItemDetailWidget extends StatelessWidget {
  const CartItemDetailWidget({
    super.key,
    required this.sW,
    required this.sH,
    required this.cartItem,
  });

  final double sW;
  final double sH;
  final CartItem cartItem;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: sW * 0.28,
          height: sH * 0.15,
          decoration: BoxDecoration(
            color: AppColors.secondaryButtonColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(width: sW * 0.05),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            txt(cartItem.product.name, size: 18, weight: FontWeight.w500),
            txt(
              "${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)} + (${(0.18 * cartItem.product.price * cartItem.quantity).toStringAsFixed(2)} Tax)",
              size: 18,
              weight: FontWeight.w500,
              color: AppColors.secondaryTextColor,
            ),
            SizedBox(height: sH * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<CartBloc>(
                          context,
                        ).add(DecrementItem(cartItem.product));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.amber,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.borderButtonColor,
                            width: 1,
                          ),
                        ),
                        padding: EdgeInsets.all(2),
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: AppColors.borderButtonColor,
                        ),
                      ),
                    ),
                    SizedBox(width: sW * 0.02),

                    txt(
                      "${cartItem.quantity}",
                      size: 18,
                      weight: FontWeight.w500,
                    ),
                    SizedBox(width: sW * 0.02),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<CartBloc>(
                          context,
                        ).add(IncrementItem(cartItem.product));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.amber,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.borderButtonColor,
                            width: 1,
                          ),
                        ),
                        padding: EdgeInsets.all(2),
                        child: Icon(
                          Icons.keyboard_arrow_up_rounded,
                          color: AppColors.borderButtonColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: sW * 0.26),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<CartBloc>(
                      context,
                    ).add(RemoveItem(cartItem.product));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      // color: Colors.amber,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.borderButtonColor,
                        width: 1,
                      ),
                    ),
                    padding: EdgeInsets.all(2),
                    child: Icon(
                      Icons.delete_outline,
                      color: AppColors.borderButtonColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
