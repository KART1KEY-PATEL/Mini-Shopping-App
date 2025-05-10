import 'package:flutter/material.dart';
import 'package:mini_shopping_app/utils/color.dart';
import 'package:mini_shopping_app/utils/custom_button.dart';
import 'package:mini_shopping_app/utils/text_util.dart';
import 'package:mini_shopping_app/widget/cart_address_widget.dart';
import 'package:mini_shopping_app/widget/cart_item_list_widget.dart';
import 'package:mini_shopping_app/widget/cart_order_info_items.dart';
import 'package:mini_shopping_app/widget/cart_payment_widget.dart';
import 'package:mini_shopping_app/widget/icon_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: AppColors.seco,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconWidget(
                      iconAsset: "assets/icons/back.svg",
                      reverseColor: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: sW * 0.28),
                    txt(
                      "Cart",
                      size: sW * 0.06,
                      weight: FontWeight.w500,
                      color: AppColors.primaryTextColor,
                    ),
                  ],
                ),
                SizedBox(height: sH * 0.02),
                CartItemListWidget(sH: sH, sW: sW),
                SizedBox(height: sH * 0.02),
                txt(
                  "Delivery Address",
                  size: sW * 0.05,
                  weight: FontWeight.w500,
                ),
                SizedBox(height: sH * 0.02),
                CartAddressWidget(sW: sW, sH: sH),
                SizedBox(height: sH * 0.02),
                txt("Payment", size: sW * 0.05, weight: FontWeight.w500),
                SizedBox(height: sH * 0.02),
                CartPaymentWidget(sW: sW, sH: sH),
                SizedBox(height: sH * 0.02),
                txt("Order Info", size: sW * 0.05, weight: FontWeight.w500),
                SizedBox(height: sH * 0.02),
                Column(
                  children: [
                    CartOrderInfoItems(title: "Subtotal", price: "9999"),
                    SizedBox(height: sH * 0.01),

                    CartOrderInfoItems(title: "Delivery Charge", price: "100"),
                    SizedBox(height: sH * 0.01),

                    CartOrderInfoItems(title: "Total", price: "100000"),
                  ],
                ),
                SizedBox(height: sH * 0.02),
                CustomButton(
                  title: "Checkout",
                  onPressed: () {},
                  sH: sH,
                  sW: sW,
                ),
                SizedBox(height: sH * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
