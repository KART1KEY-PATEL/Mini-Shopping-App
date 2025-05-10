import 'package:flutter/material.dart';
import 'package:mini_shopping_app/models/product_model.dart';
import 'package:mini_shopping_app/utils/color.dart';
import 'package:mini_shopping_app/utils/custom_appBar.dart';
import 'package:mini_shopping_app/widget/icon_widget.dart';
import 'package:mini_shopping_app/widget/item_detail_widget.dart';

class ItemPage extends StatelessWidget {
  ItemPage({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.secondaryButtonColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconWidget(
                      iconAsset: "assets/icons/back.svg",
                      reverseColor: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),

                    IconWidget(
                      iconAsset: "assets/icons/bag.svg",
                      onPressed: () {},
                      reverseColor: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: sH * 0.02),
              Container(height: sH * 0.42, width: sW, color: Colors.amber),
              ItemDetailWidget(product: product),
            ],
          ),
        ),
      ),
    );
  }
}
