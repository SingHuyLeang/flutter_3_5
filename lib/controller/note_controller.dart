import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/data/note.dart';
import 'package:test/storage/sqlite/sqlite.dart';

class NoteController extends GetxController {
  final sqlie = SQLite();
  final RxList<Note> noteList = <Note>[].obs;
  final textController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    refreshNote();
  }

  void refreshNote() async {
    noteList.clear();
    noteList.addAll(await sqlie.getNotes());
    for (var note in noteList) {
      log("${note.id} : ${note.task}");
    }
    update();
  }

  void addNote() async {
    if (textController.text.isEmpty) {
      Get.snackbar('Note is empty', 'Please enter a note');
    } else if (await sqlie.addNote(textController.text)) {
      Get.snackbar('Note', 'Your note has been added');
      textController.clear();
      refreshNote();
    }
    update();
  }

  void delete(int id) async {
    if (await sqlie.deleteNote(id)) {
      Get.snackbar('Note', 'Your note has been deleted');
      refreshNote();
    } else {
      Get.snackbar('Error', 'Failed to delete note');
    }
    update();
  }
}
