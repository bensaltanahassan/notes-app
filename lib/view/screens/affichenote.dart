import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controller/editnotecontroller.dart';
import 'package:notes_app/controller/homecontroller.dart';
import 'package:notes_app/controller/viewnotecontroller.dart';
import 'package:notes_app/view/widgets/customicon.dart';

class ViewNote extends StatelessWidget {
  ViewNote({Key? key}) : super(key: key);
  final viewNoteController =
      Get.lazyPut(() => ViewNoteController(), fenix: true);
  final homeController = Get.lazyPut(() => HomeController(), fenix: true);
  final editNoteController =
      Get.lazyPut(() => EditNoteController(), fenix: true);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: SingleChildScrollView(
            child: GetBuilder<ViewNoteController>(
              builder: (controller) {
                if (!controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomIcon(
                            onPressed: () {
                              Get.back();
                            },
                            color: Colors.grey[600],
                            icon: const Icon(
                              Icons.arrow_back_ios_sharp,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              CustomIcon(
                                onPressed: () {
                                  Get.find<EditNoteController>().id.value =
                                      controller.id.value;
                                  Get.find<EditNoteController>()
                                      .readData(controller.id.value);
                                  Get.toNamed('/editnote');
                                },
                                color: Colors.grey[600],
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              CustomIcon(
                                onPressed: () {
                                  Get.find<HomeController>()
                                      .deleteNote(controller.id.value);
                                  Get.offAllNamed('/');
                                },
                                color: Colors.grey[600],
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.title.value,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            controller.note.value,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

String text1 =
    'hvsdvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv';

String text2 =
    ' lmascccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccascascascascascascasdccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc';
