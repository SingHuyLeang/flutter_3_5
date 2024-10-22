import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

class Converter {
  FileImage convertStringToFileImage(String image) {
    try {
      if (image.isNotEmpty) {
        return FileImage(File(image));
      } else {
        log('No image provided');
        return FileImage(File(''));
      }
    }on PathNotFoundException catch (e) {
      log('Error converting string to file image: $e');
      rethrow;
    }
  }
}
