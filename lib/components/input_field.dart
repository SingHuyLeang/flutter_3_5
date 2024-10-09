import 'package:flutter/material.dart';
import 'package:pet_app/components/asset_button.dart';
import 'package:pet_app/utils/types/colors.dart';
import 'package:pet_app/utils/types/fonts.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.controller,
    required this.hint,
    this.isPasswordField = false,
    this.hidden = false,
    this.width = double.infinity,
    this.height = 50.0,
    this.icon,
    this.onTab,
    this.alignment = Alignment.center,
  });

  final TextEditingController controller;
  final bool isPasswordField, hidden;
  final double width, height;
  final String hint;
  final String? icon;
  final void Function()? onTab;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: alignment,
      padding: icon == null
          ? const EdgeInsets.symmetric(horizontal: 16.0)
          : const EdgeInsets.only(left: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: PColors.stroke, width: 1.5),
      ),
      child: TextField(
        controller: controller,
        obscureText: hidden,
        keyboardType: isPasswordField
            ? TextInputType.visiblePassword
            : TextInputType.text,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 16,
            color: PColors.solid,
            fontFamily: Font.medium,
          ),
          suffixIcon: icon != null
              ? AssetButton(
                  width: 24,
                  height: 24,
                  icon: icon!,
                  onTab: onTab,
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
        ),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
