import 'dart:developer';
import 'package:image_picker/image_picker.dart';

Future<String> pickImage() async {
  try {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    return file?.path ?? "Empty";
  } catch (e) {
    log("Exception in pickImage : $e");
    return "Error";
  }
}
