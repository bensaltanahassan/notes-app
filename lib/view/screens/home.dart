import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controller/editnotecontroller.dart';
import 'package:notes_app/controller/homecontroller.dart';
import 'package:notes_app/controller/viewnotecontroller.dart';
import 'package:notes_app/utils/const.dart';
import 'package:notes_app/view/widgets/customNoteAffichage.dart';
import 'package:notes_app/view/widgets/customicon.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomeController homeController = Get.put(HomeController());
  final editNoteController = Get.lazyPut(() => EditNoteController());
  final viewNoteController = Get.lazyPut(() => ViewNoteController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed('/addnote');
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.grey[600],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Notes',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    Row(
                      children: [
                        CustomIcon(
                            onPressed: () {},
                            color: Colors.grey[600],
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomIcon(
                            onPressed: () {},
                            color: Colors.grey[600],
                            icon: const Icon(
                              Icons.info_outline,
                              color: Colors.white,
                            )),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GetBuilder<HomeController>(
                    builder: (controller) {
                      if (controller.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (controller.notes.value.isEmpty) {
                          return Center(
                            child: Column(
                              children: [
                                Image.asset('assets/images/addnote.png'),
                                const Text(
                                  'Create your first note !',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.notes.value.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  child: CustomNoteAffich(
                                    text: controller.notes.value[index]
                                        ['title'],
                                    color: myColors[
                                        Random().nextInt(myColors.length)],
                                  ),
                                  onTap: () {
                                    Get.find<ViewNoteController>().readData(
                                        controller.notes.value[index]['id']);
                                    Get.toNamed(
                                      '/viewnote',
                                    );
                                  },
                                );
                              });
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
