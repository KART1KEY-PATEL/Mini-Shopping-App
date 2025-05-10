import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shopping_app/bloc/cart/cart_bloc.dart';
import 'package:mini_shopping_app/bloc/cart/cart_event.dart';
import 'package:mini_shopping_app/bloc/cart/cart_state.dart';
import 'package:mini_shopping_app/models/product_model.dart';
import 'package:mini_shopping_app/utils/color.dart';
import 'package:mini_shopping_app/utils/custom_button.dart';
import 'package:mini_shopping_app/utils/text_util.dart';
import 'package:mini_shopping_app/widget/size_button_widget.dart';

class ItemDetailWidget extends StatefulWidget {
  const ItemDetailWidget({super.key, required this.product});
  final Product product;

  @override
  State<ItemDetailWidget> createState() => _ItemDetailWidgetState();
}

class _ItemDetailWidgetState extends State<ItemDetailWidget> {
  int selectedSize = 0; // Initialize with 0 or any default index
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
                  "${widget.product.smallDescription}",
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
                txt(
                  "${widget.product.name}",
                  size: 22,
                  weight: FontWeight.w600,
                ),
                txt(
                  widget.product.price.toString(),
                  size: 22,
                  weight: FontWeight.w600,
                ),
              ],
            ),
            txt("Size", size: 18, weight: FontWeight.w600),
            SizedBox(
              height: sH * 0.072,
              width: sW * 0.9,
              child: SizeButtonWidget(
                sizes: widget.product.sizes,
                selectSize: selectedSize,
                onSizeSelected: (index) {
                  print("UPDATED SIZE : ${index}");
                  setState(() {
                    selectedSize = index;
                  });
                },
              ),
            ),
            SizedBox(height: sH * 0.02),
            txt("Description", size: 18, weight: FontWeight.w600),
            txt(
              "${widget.product.longDescription}",
              size: 16,
              weight: FontWeight.w400,
            ),
            SizedBox(height: sH * 0.02),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                bool isItemInCart = state.isItemInCart(widget.product.id);
                int itemQuantity = state.getItemQuantity(widget.product.id);
                if (isItemInCart) {
                  return Container(
                    height: sH * 0.07,
                    width: sW,
                    decoration: BoxDecoration(
                      color: AppColors.primaryButtonColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<CartBloc>(
                              context,
                            ).add(DecrementItem(widget.product));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              // color: Colors.amber,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.whiteSVGColor,
                                width: 1,
                              ),
                            ),
                            padding: EdgeInsets.all(2),
                            child: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: AppColors.whiteSVGColor,
                            ),
                          ),
                        ),
                        SizedBox(width: sW * 0.02),

                        txt(
                          "${itemQuantity}",
                          size: 18,
                          weight: FontWeight.w500,
                          color: AppColors.whiteSVGColor,
                        ),
                        SizedBox(width: sW * 0.02),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<CartBloc>(
                              context,
                            ).add(IncrementItem(widget.product));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              // color: Colors.amber,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.whiteSVGColor,
                                width: 1,
                              ),
                            ),
                            padding: EdgeInsets.all(2),
                            child: Icon(
                              Icons.keyboard_arrow_up_rounded,
                              color: AppColors.whiteSVGColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return CustomButton(
                  title: "Add to Cart",
                  onPressed: () {
                    print("Item Added to Cart");
                    BlocProvider.of<CartBloc>(
                      context,
                    ).add(AddItem(widget.product));
                  },
                  sH: sH,
                  sW: sW,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
