import 'package:get/get.dart';
import 'package:notes_app/data/sqldb.dart';

class ViewNoteController extends GetxController {
  SqlDb sqlDb = SqlDb();
  List<Map>? noteData;
  RxBool isLoading = true.obs;
  RxInt id = 0.obs;
  RxString title = "".obs;
  RxString note = "".obs;
  RxString color = "".obs;

  readData(int noteId) async {
    RxBool isLoading = true.obs;
    id.value = noteId;
    List<Map> response = await sqlDb.readData('''
    SELECT * FROM notes WHERE id = ${id.value}
    ''');
    noteData = response;
    print(response);
    note.value = response[0]['note'];
    title.value = response[0]['title'];
    color.value = response[0]['color'];
    isLoading.value = false;
  }
}
