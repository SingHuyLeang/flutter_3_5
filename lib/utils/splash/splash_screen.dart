import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_app/featured/app/view/home/home_page.dart';
import 'package:pet_app/featured/authentication/views/login_page.dart';

class SplashController extends GetxController {
  final isLogged = false;

  Future delayed() async {
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  void onInit() async {
    super.onInit();
    delayed().whenComplete(
      () => Get.to(() => isLogged ? HomePage() : LogInPage()),
    );
  }
}

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splash = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Hero(
            tag: 11111111,
            child: SvgPicture.asset(
              "assets/images/logo.svg",
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
