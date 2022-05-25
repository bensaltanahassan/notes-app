import 'package:get/get.dart';
import 'package:notes_app/data/sqldb.dart';
import 'package:flutter/material.dart';

class AddNoteController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController noteController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController colorController = TextEditingController();

  SqlDb sqlDb = SqlDb();
  RxBool isLoading = true.obs;
  RxInt id = 0.obs;
  RxString title = "".obs;
  RxString note = "".obs;
  RxString color = "".obs;

  addNote() async {
    int response = await sqlDb.insertData('''
        INSERT INTO notes ("note" ,"title" ,"color")
         VALUES ("${note.value}", "${title.value}", "${color.value}")
        ''');
    if (response != 0) {
      Get.offAllNamed('/');
    }
  }
}
