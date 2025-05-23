import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shopping_app/bloc/brand/brand_bloc.dart';
import 'package:mini_shopping_app/bloc/brand/brand_state.dart';
import 'package:mini_shopping_app/bloc/cart/cart_bloc.dart';
import 'package:mini_shopping_app/bloc/cart/cart_state.dart';
import 'package:mini_shopping_app/constants/contants.dart';
import 'package:mini_shopping_app/extensions/string_extensions.dart';
import 'package:mini_shopping_app/models/product_model.dart';
import 'package:mini_shopping_app/services/product_service.dart';
import 'package:mini_shopping_app/utils/color.dart';
import 'package:mini_shopping_app/utils/custom_appBar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_shopping_app/utils/text_util.dart';
import 'package:mini_shopping_app/widget/brand_widget.dart';
import 'package:mini_shopping_app/widget/cart_icon_widget.dart';
import 'package:mini_shopping_app/widget/icon_widget.dart';
import 'package:mini_shopping_app/widget/category_widget.dart';
import 'package:mini_shopping_app/widget/item_thumbnail_widget.dart';
import 'package:mini_shopping_app/widget/search_mic_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<ProductList> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = ProductService().loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppBar(
        title: '',
        actions: [CartIconWidget(sH: sH, sW: sW), SizedBox(width: sW * 0.02)],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: sW * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    txt("Kartikey Patel", isBold: true, size: sW * 0.07),
                    txt(
                      "Welcome to the shopping app",
                      isBold: false,
                      size: sW * 0.04,
                      color: AppColors.secondaryTextColor,
                    ),
                    SizedBox(height: sH * 0.02),
                    CategoryWidget(categoryName: "Choose Brand"),

                    SizedBox(height: sH * 0.01),
                    BrandWidget(),
                    SizedBox(height: sH * 0.02),
                    CategoryWidget(categoryName: "New Arrivals"),
                    SizedBox(height: sH * 0.01),
                  ],
                ),
              ),
            ),
            BlocBuilder<BrandBloc, BrandState>(
              builder: (context, brandState) {
                return FutureBuilder<ProductList>(
                  future: futureProducts,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Product> products = snapshot.data!.products;
                      if (brandState is BrandSelected) {
                        products =
                            products
                                .where(
                                  (product) =>
                                      product.brand.toLowerCase() ==
                                      brandState.selectedBrand.toLowerCase(),
                                )
                                .toList();
                      }
                      return SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: sW * 0.05),
                        sliver: SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.55,
                              ),
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            Product product = products[index];
                            return ItemThumbnailWidget(
                              sH: sH,
                              sW: sW,
                              product: product,
                            );
                          }, childCount: products.length),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return SliverToBoxAdapter(
                        child: Center(child: Text("${snapshot.error}")),
                      );
                    }
                    return SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
