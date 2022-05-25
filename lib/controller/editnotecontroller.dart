import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/data/sqldb.dart';

class EditNoteController extends GetxController {
  Rx<int> id = 0.obs;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController noteController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  SqlDb sqlDb = SqlDb();
  List<Map>? noteData;
  RxBool isLoading = true.obs;

  readData(int noteId) async {
    id.value = noteId;
    List<Map> response = await sqlDb.readData('''
    SELECT * FROM notes WHERE id = ${id.value}
    ''');
    noteData = response;
    noteController.text = response[0]['note'];
    titleController.text = response[0]['title'];
    colorController.text = response[0]['color'];
    isLoading.value = false;
  }

  editNote() async {
    int response = await sqlDb.updateData('''
        UPDATE notes SET note = "${noteController.text}", title = "${titleController.text}", color = "${colorController.text}" WHERE id = ${id.value}
        ''');
    if (response != 0) {
      Get.offAllNamed('/');
    }
  }
}
