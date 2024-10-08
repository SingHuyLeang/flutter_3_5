import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_app/utils/theme/text_theme.dart';
import 'package:pet_app/utils/types/colors.dart';

class AssetButton extends StatelessWidget {
  const AssetButton({
    super.key,
    this.icon,
    this.text,
    this.onTab,
    this.width,
    this.height,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.color,
    this.textColor,
    this.padding = 12,
    this.iconColor,
    this.radius = 12,
    this.textSize = 14,
    this.isOutlinButton = false,
    this.iconSize,
  });

  final String? icon, text;
  final void Function()? onTab;
  final double? width, height;
  final MainAxisAlignment mainAxisAlignment;
  final Color? color, textColor;
  final double padding;
  final Color? iconColor;
  final double radius, textSize;
  final double? iconSize;
  final bool isOutlinButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          border: !isOutlinButton ? null : Border.all(color: PColors.stroke),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: [
              if (icon != null)
                SvgPicture.asset(
                  icon!,
                  color: iconColor,
                  width: iconSize,
                  height: iconSize,
                ),
              PText(
                text: text ?? "",
                color: textColor ?? PColors.light,
                size: textSize,
              )
            ],
          ),
        ),
      ),
    );
  }
}
