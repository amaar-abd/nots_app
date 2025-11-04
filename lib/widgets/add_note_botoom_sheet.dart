import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/helper/snakbar_method.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),

      child: BlocListener<AddNoteCubit, AddNotesState>(
        // the cubit
        listener: (context, state) {
          if (state is NoteFailure) {}

          if (state is NoteSuccess) {
            snackBarr(context, 'done');
            Navigator.pop(context);
            BlocProvider.of<NotesCubit>(context).featshAllNotes;
          }
        },

        child: FormAddNote(),
      ),
    );
  }
}
