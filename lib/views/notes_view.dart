import 'package:flutter/material.dart';
import 'package:notes_app/widgets/add_note_botoom_sheet.dart';
import 'package:notes_app/widgets/body_note.dart';

class NotesView extends StatelessWidget {
  NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return const AddNoteBottomSheet();
            },
          );
        },
        child: Icon(Icons.add, color: Colors.black),
        backgroundColor: Colors.cyan,
      ),
      body: BodyNote(),
    );
  }
}
