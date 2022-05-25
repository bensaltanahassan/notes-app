import 'package:get/get.dart';
import 'package:notes_app/controller/addnotecontroller.dart';
import 'package:notes_app/controller/editnotecontroller.dart';
import 'package:notes_app/controller/homecontroller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }
}
