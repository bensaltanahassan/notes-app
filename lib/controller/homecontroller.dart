import 'package:get/get.dart';
import 'package:notes_app/data/sqldb.dart';

class HomeController extends GetxController {
  SqlDb sqlDb = SqlDb();
  Rx<List<Map>> notes = Rx<List<Map>>([]);
  RxBool isLoading = true.obs;
  @override
  void onInit() {
    addNotes();
    super.onInit();
  }

  Future<List<Map>> readData() async {
    List<Map> response = await sqlDb.readData('SELECT * FROM notes');
    return response;
  }

  void addNotes() async {
    List<Map<dynamic, dynamic>> response = await readData();
    notes.value = response;
    isLoading.value = false;
    update();
  }

  deleteNote(int id) async {
    await sqlDb.deleteData('''
  DELETE FROM notes WHERE id = $id
  ''');
    addNotes();
    update();
  }

  deleteDATABASE() async {
    await sqlDb.deleteDataBase();
    notes.value = [];
    print(notes.value.length);
    update();
  }
}
