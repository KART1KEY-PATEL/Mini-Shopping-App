import 'package:flutter/material.dart';
import 'package:mini_shopping_app/constants/contants.dart';
import 'package:mini_shopping_app/extensions/string_extensions.dart';
import 'package:mini_shopping_app/utils/color.dart';
import 'package:mini_shopping_app/utils/custom_appBar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_shopping_app/utils/text_util.dart';
import 'package:mini_shopping_app/widget/brand_widget.dart';
import 'package:mini_shopping_app/widget/category_widget.dart';
import 'package:mini_shopping_app/widget/item_thumbnail_widget.dart';
import 'package:mini_shopping_app/widget/search_mic_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppBar(
        title: '',
        actions: [
          Container(
            height: sH * 0.05,
            width: sW * 0.13,
            decoration: BoxDecoration(
              color: AppColors.secondaryButtonColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/icons/bag.svg',
                height: 50,
                width: 50,
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(width: sW * 0.02),
        ],
      ),
      body: CustomScrollView(
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
                  SearchMicWidget(),
                  SizedBox(height: sH * 0.02),
                  CategoryWidget(categoryName: "Choose Brand"),
                  BrandWidget(),
                  CategoryWidget(categoryName: "New Arrivals"),
                  SizedBox(height: sH * 0.03),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: sW * 0.05),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.5,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => ItemThumbnailWidget(sH: sH, sW: sW),
                childCount: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
