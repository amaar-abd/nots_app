import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/helper/snakbar_method.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/custom_textfield.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 50),
            CustomAppbar(
              text: 'Edit Vote',
              icon: Icons.check,
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subtitle = subtitle?? widget.note.subtitle;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).featshAllNotes();
                Navigator.pop(context);
                snackBarr(context, 'the edit  done');
              },
            ),

            SizedBox(height: 60),
            CustomTextFormField(
              hintText: 'title',
              onChanged: (value) {
                title = value;
              },
            ),

            SizedBox(height: 30),
            CustomTextFormField(
              hintText: 'content',
              maxLines: 5,
              onChanged: (value) {
                subtitle = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
