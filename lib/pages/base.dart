import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_shopping_app/pages/cart_page.dart';
import 'package:mini_shopping_app/pages/home_page.dart';
import 'package:mini_shopping_app/pages/like_page.dart';
import 'package:mini_shopping_app/utils/color.dart';

class Base extends StatefulWidget {
  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  bool isLoading = true;
  bool isCompany = false;
  List _screens = [HomePage(), LikePage()];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: new Theme(
        data: Theme.of(
          context,
        ).copyWith(canvasColor: AppColors.secondaryButtonColor),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryButtonColor,
          unselectedItemColor: AppColors.secondarySVGColor,
          selectedLabelStyle: TextStyle(
            color: AppColors.lightBlueAccentButtonColor,
          ),
          unselectedLabelStyle: TextStyle(color: AppColors.secondarySVGColor),
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Like'),
          ],
        ),
      ),
    );
  }
}
