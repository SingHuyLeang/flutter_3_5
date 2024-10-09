import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_app/utils/theme/text_theme.dart';
import 'package:pet_app/utils/types/colors.dart';

class FormUploadImg extends StatelessWidget {
  const FormUploadImg({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      strokeWidth: 2,
      color: PColors.stroke,
      borderType: BorderType.RRect,
      dashPattern: const [9, 3],
      radius: const Radius.circular(12),
      child: GestureDetector(
        onTap: () {},
        child: SizedBox(
          width: 250,
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              SvgPicture.asset("assets/images/logo.svg"),
              const SizedBox(height: 16),
              // camera icon
              // upload text
              PText(text: "Upload image", size: 16, color: PColors.solid)
            ],
          ),
        ),
      ),
    );
  }
}
