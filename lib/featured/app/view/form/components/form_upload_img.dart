import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_app/components/pick_image.dart';
import 'package:pet_app/featured/app/controller/pet_controller.dart';
import 'package:pet_app/utils/theme/text_theme.dart';
import 'package:pet_app/utils/types/colors.dart';

class FormUploadImg extends StatelessWidget {
  FormUploadImg({super.key});
  final controller = Get.put(PetController());
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      strokeWidth: 2,
      color: PColors.stroke,
      borderType: BorderType.RRect,
      dashPattern: const [9, 3],
      radius: const Radius.circular(12),
      child: GestureDetector(
        onTap: () => controller.selectImage(),
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
