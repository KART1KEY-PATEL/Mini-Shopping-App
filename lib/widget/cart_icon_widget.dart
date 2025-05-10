import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shopping_app/bloc/cart/cart_bloc.dart';
import 'package:mini_shopping_app/bloc/cart/cart_state.dart';
import 'package:mini_shopping_app/utils/text_util.dart';
import 'package:mini_shopping_app/widget/icon_widget.dart';

class CartIconWidget extends StatelessWidget {
  const CartIconWidget({super.key, required this.sW, required this.sH});
  final double sW;
  final double sH;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Stack(
          children: [
            IconWidget(
              iconAsset: "assets/icons/bag.svg",
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
            ),
            Positioned(
              right: 0,
              child: Container(
                width: sW * 0.05,
                height: sW * 0.05,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: txt(
                    state.items.length.toString(),
                    size: sW * 0.03,
                    // color: AppColors.,
                    isBold: true,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
