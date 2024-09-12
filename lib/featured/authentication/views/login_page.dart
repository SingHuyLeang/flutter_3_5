import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_app/components/asset_button.dart';
import 'package:pet_app/components/input_field.dart';
import 'package:pet_app/utils/theme/text_theme.dart';
import 'package:pet_app/utils/types/colors.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

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
                const PText(text: "Log In", size: 32, isBold: true),
                // image
                const SizedBox(height: 32),
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'assets/images/walk_dreaming.svg',
                    width: 233,
                    height: 231,
                    fit: BoxFit.contain,
                  ),
                ),
                // description
                const SizedBox(height: 97),
                const PText(
                  text:
                      "Please enter your username & password to log in your account.",
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
                // Term & Conditions
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // checkbox
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                      activeColor: PColors.primary,
                      side: BorderSide(
                        color: PColors.solid,
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const PText(
                      text: "By checking box you agree to our ",
                      size: 10.5,
                    ),
                    PText(
                      text: "Terms ",
                      size: 10.5,
                      color: PColors.primary,
                    ),
                    const PText(
                      text: "&",
                      size: 10.5,
                    ),
                    PText(
                      text: "Conditions",
                      size: 10.5,
                      color: PColors.primary,
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                // button log in
                Align(
                  alignment: Alignment.center,
                  child: AssetButton(
                    width: 150,
                    height: 50,
                    text: "Log In",
                    color: PColors.primary,
                    onTab: () {},
                  ),
                ),
                const SizedBox(height: 24),
                // create a new account
                Align(
                  alignment: Alignment.center,
                  child: AssetButton(
                    width: double.infinity,
                    text: "Create new account ?",
                    textColor: PColors.primary,
                    onTab: () {},
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
