import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shopping_app/bloc/like/like_bloc.dart';
import 'package:mini_shopping_app/bloc/like/like_state.dart';
import 'package:mini_shopping_app/utils/color.dart';
import 'package:mini_shopping_app/utils/text_util.dart';
import 'package:mini_shopping_app/widget/item_thumbnail_widget.dart';

class LikePage extends StatelessWidget {
  const LikePage({super.key});

  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: BlocBuilder<LikesBloc, LikesState>(
            builder: (context, state) {
              final likedProducts = state.likedProducts;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      txt(
                        "Likes",
                        size: sW * 0.06,
                        weight: FontWeight.w500,
                        color: AppColors.primaryTextColor,
                      ),
                    ],
                  ),
                  SizedBox(height: sH * 0.02),
                  Expanded(
                    child:
                        likedProducts.isEmpty
                            ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.favorite_border,
                                    size: sW * 0.2,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: sH * 0.02),
                                  txt(
                                    "No items liked yet",
                                    size: sW * 0.045,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            )
                            : GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: (sW * 0.45) / (sH * 0.45),
                                    mainAxisSpacing: sH * 0.02,
                                    crossAxisSpacing: sW * 0.04,
                                  ),
                              itemCount: likedProducts.length,
                              itemBuilder: (context, index) {
                                final product = likedProducts[index];
                                return ItemThumbnailWidget(
                                  sH: sH,
                                  sW: sW,
                                  product: product,
                                );
                              },
                            ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
