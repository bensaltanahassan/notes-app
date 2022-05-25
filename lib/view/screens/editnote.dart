import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controller/addnotecontroller.dart';
import 'package:notes_app/controller/editnotecontroller.dart';
import 'package:notes_app/view/widgets/customicon.dart';

class EditNote extends StatelessWidget {
  EditNote({Key? key}) : super(key: key);
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
            child: GetBuilder<EditNoteController>(
              builder: (controller) {
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
                        CustomIcon(
                          onPressed: () {
                            controller.editNote();
                          },
                          color: Colors.grey[600],
                          icon: const Icon(
                            Icons.save,
                            color: Colors.white,
                          ),
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
                        TextFormField(
                          minLines: 1,
                          maxLines: 3,
                          controller: controller.titleController,
                          decoration: InputDecoration(
                            hintText: 'Title',
                            hintStyle: TextStyle(
                              color: Colors.grey[600],
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          minLines: 1,
                          maxLines: 10,
                          controller: controller.noteController,
                          decoration: InputDecoration(
                            hintText: 'Type Something ...',
                            hintStyle: TextStyle(
                              color: Colors.grey[600],
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
