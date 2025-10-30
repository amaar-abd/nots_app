import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/custom_textfield.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 50),
            CustomAppbar(text: 'Edit Vote', icon: Icons.check),
            SizedBox(height: 60),
            CustomTextField(hintText: 'title'),
            SizedBox(height: 30),
            CustomTextField(hintText: 'content', maxLines: 5),
          ],
        ),
      ),
    );
  }
}
