import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shopping_app/bloc/cart/cart_bloc.dart';
import 'package:mini_shopping_app/bloc/cart/cart_state.dart';
import 'package:mini_shopping_app/models/cart_item_model.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with back button and title
                    Row(
                      children: [
                        IconWidget(
                          iconAsset: "assets/icons/back.svg",
                          // reverseColor: true,
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

                    // Conditional rendering based on cart items
                    if (state.items.isEmpty)
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: sH * 0.3),
                            Icon(
                              Icons.shopping_cart_outlined,
                              size: sW * 0.2,
                              color: Colors.grey,
                            ),
                            SizedBox(height: sH * 0.02),
                            txt(
                              "No items added to cart",
                              size: sW * 0.045,
                              color: Colors.grey,
                            ),
                            SizedBox(height: sH * 0.02),
                            ElevatedButton(
                              onPressed: () {
                                // Navigate to products page
                                Navigator.pop(context);
                              },
                              child: txt(
                                "Continue Shopping",
                                size: sW * 0.04,
                                color: Colors.white,
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    else
                      CartDetails(
                        sH: sH,
                        sW: sW,
                        cartItems: state.items,
                        subtotal: state.subtotal,
                        deliveryCharge: state.deliveryCharge,
                        total: state.total,
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CartDetails extends StatelessWidget {
  const CartDetails({
    super.key,
    required this.sH,
    required this.sW,
    required this.cartItems,
    required this.subtotal,
    required this.deliveryCharge,
    required this.total,
  });

  final double sH;
  final double sW;
  final List<CartItem> cartItems;
  final double subtotal;
  final double deliveryCharge;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CartItemListWidget(sH: sH, sW: sW, cartItem: cartItems),
        SizedBox(height: sH * 0.02),
        txt("Delivery Address", size: sW * 0.05, weight: FontWeight.w500),
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
            CartOrderInfoItems(
              title: "Subtotal",
              price: "${subtotal.toStringAsFixed(2)}",
            ),
            SizedBox(height: sH * 0.01),
            CartOrderInfoItems(
              title: "Delivery Charge",
              price: "${deliveryCharge.toStringAsFixed(2)}",
            ),
            SizedBox(height: sH * 0.01),
            CartOrderInfoItems(
              title: "Total",
              price: "${total.toStringAsFixed(2)}",
            ),
          ],
        ),
        SizedBox(height: sH * 0.02),
        CustomButton(title: "Checkout", onPressed: () {}, sH: sH, sW: sW),
        SizedBox(height: sH * 0.02),
      ],
    );
  }
}
