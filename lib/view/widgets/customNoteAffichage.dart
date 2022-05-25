import 'package:flutter/material.dart';

class CustomNoteAffich extends StatelessWidget {
  CustomNoteAffich({Key? key, this.color, this.text}) : super(key: key);
  final Color? color;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          width: 300,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                text!,
                maxLines: 2,
                style: const TextStyle(color: Colors.white, fontSize: 35),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
