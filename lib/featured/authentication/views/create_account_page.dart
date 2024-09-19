import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pet_app/components/asset_button.dart';
import 'package:pet_app/components/input_field.dart';
import 'package:pet_app/utils/theme/text_theme.dart';
import 'package:pet_app/utils/types/colors.dart';
import 'package:pet_app/utils/types/fonts.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 47, left: 32, right: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // title
                const PText(
                    text: "Create account", size: 32, fontType: Font.bold),
                // image
                const SizedBox(height: 32),
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'assets/images/welcome_cats.svg',
                    width: 233,
                    height: 231,
                    fit: BoxFit.contain,
                  ),
                ),
                // description
                const SizedBox(height: 71),
                const PText(
                  text: "Please enter all fields to create new account.",
                ),
                // form
                const SizedBox(height: 32),
                InputField(
                  controller: TextEditingController(),
                  hint: "Enter your username",
                ),
                const SizedBox(height: 16),
                InputField(
                  controller: TextEditingController(),
                  hint: "Enter your password",
                  icon: "assets/images/eye.svg",
                ),
                const SizedBox(height: 16),
                InputField(
                  controller: TextEditingController(),
                  hint: "Enter your confirm password",
                  icon: "assets/images/eye.svg",
                ),
                const SizedBox(height: 32),
                // button log in
                Align(
                  alignment: Alignment.center,
                  child: AssetButton(
                    width: 196,
                    height: 50,
                    text: "Create my account",
                    color: PColors.primary,
                    onTab: () {},
                  ),
                ),
                // create a new account
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const PText(
                        text: "Already have an account ?",
                      ),
                      const SizedBox(width: 4),
                      AssetButton(
                        text: "Log In",
                        textColor: PColors.primary,
                        onTab: () => Get.back(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
