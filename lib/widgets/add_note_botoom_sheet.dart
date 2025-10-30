import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_bottom.dart';
import 'package:notes_app/widgets/custom_textfield.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(hintText: 'Title'),
              SizedBox(height: 30),
              CustomTextField(hintText: 'discreption', maxLines: 5),
              SizedBox(height: 50),
              CustomBottom(),
            ],
          ),
        ),
      ),
    );
  }
}
