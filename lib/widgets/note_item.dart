import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNoteView();
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.only(left: 12, top: 20, bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(note.color),
        ),

        child: Column(
          children: [
            ListTile(
              title: Text(
                note.title,
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                  height: 2.5,
                ),
              ),
              subtitle: Text(
                note.subtitle,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black.withValues(alpha: .4),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).featshAllNotes();
                },
                icon: Icon(
                  Icons.delete_outline_outlined,
                  color: Colors.black,
                  size: 35,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Text(
                    note.date,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withValues(alpha: .4),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
