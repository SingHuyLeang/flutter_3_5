import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/data/note.dart';
import 'package:test/storage/sqlite/sqlite.dart';

class NoteController extends GetxController {
  final sqlie = SQLite();
  final RxList<Note> noteList = <Note>[].obs;
  final textController = TextEditingController();
  final id = 0.obs;
  final isUpdate = false.obs;

  @override
  void onInit() {
    super.onInit();
    refreshNote();
  }

  void refreshNote() async {
    noteList.clear();
    noteList.addAll(await sqlie.getNotes());
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

  void catchId(index) async {
    id.value = noteList[index].id;
    textController.text = noteList[index].task;
    isUpdate.value = true;
    update();
  }

  void updateNote() async {
    if (id.value == 0) {
      Get.snackbar(
        'Note App',
        "Please select a note",
        duration: const Duration(seconds: 2),
      );
    } else if (textController.text.isEmpty) {
      Get.snackbar('Note is empty', 'Please enter new note');
    } else if (await sqlie.updateNote(id.value, textController.text)) {
      Get.snackbar("Note App", 'Update successfully');
      refreshNote();
      textController.clear();
      isUpdate.value = false;
      id.value = 0;
    } else {
      Get.snackbar('Error', 'Failed to update note');
    }
    update();
  }
}
