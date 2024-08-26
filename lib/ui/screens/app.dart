import 'package:flutter/material.dart';
import 'package:shoes_app/ui/screens/pages/cart.dart';
import 'package:shoes_app/ui/screens/pages/favorite.dart';
import 'package:shoes_app/ui/screens/pages/home.dart';
import 'package:shoes_app/ui/screens/pages/profile.dart';
import 'package:shoes_app/ui/theme/colors.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final navItems = [
    "assets/images/home.png",
    "assets/images/heart.png",
    "assets/images/shopping_card.png",
    "assets/images/profile.png",
  ];
  int page = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            page = value;
          });
        },
        children: const [
          HomePage(),
          FavoritePage(),
          CartPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.only(left: 32, right: 32, bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 32),
        decoration: BoxDecoration(
          color: SColors.primary,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            navItems.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  page = index;
                  pageController.animateToPage(
                    page,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                });
              },
              child: Image.asset(
                navItems[index],
                width: 26,
                height: 26,
                color: page == index ? SColors.light : SColors.dark,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
