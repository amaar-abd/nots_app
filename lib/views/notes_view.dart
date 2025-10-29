import 'package:flutter/material.dart';
import 'package:notes_app/widgets/body_note.dart';

class NotesView extends StatelessWidget {
  NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.black),
        backgroundColor: Colors.cyan,
      ),
      body: BodyNote(),
    );
  }
}
