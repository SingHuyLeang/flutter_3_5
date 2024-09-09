import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/data/note.dart';
import 'package:test/storage/sqlite/sqlite.dart';

class NoteController extends GetxController {
  final sqlie = SQLite();
  final RxList<Note> noteList = <Note>[].obs;
  final textController = TextEditingController();

  void addNote() async {
    if (textController.text.isEmpty) {
      Get.snackbar('Note is empty', 'Please enter a note');
    } else if (await sqlie.addNote(textController.text)) {
      Get.snackbar('Note', 'Your note has been added');
      textController.clear();
    }
    update();
  }
}
