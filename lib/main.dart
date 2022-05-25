import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/utils/mybinding.dart';
import 'package:notes_app/view/screens/addnote.dart';
import 'package:notes_app/view/screens/affichenote.dart';
import 'package:notes_app/view/screens/editnote.dart';
import 'package:notes_app/view/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage(), binding: MyBindings()),
        GetPage(name: '/addnote', page: () => AddNote()),
        GetPage(name: '/editnote', page: () => EditNote()),
        GetPage(name: '/viewnote', page: () => ViewNote()),
      ],
    );
  }
}
