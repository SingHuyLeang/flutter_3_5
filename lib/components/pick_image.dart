import 'dart:developer';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

Future<File> pickImage() async {
  try {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    return File(file!.path);
  } catch (e) {
    log("Exception in pickImage : $e");
    rethrow;
  }
}
