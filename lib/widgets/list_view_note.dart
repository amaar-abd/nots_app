import 'package:flutter/material.dart';
import 'package:notes_app/widgets/note_item.dart';

class listviewnote extends StatelessWidget {
  const listviewnote({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return NoteItem();
        },
      ),
    );
  }
}
