import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:hive_flutter/adapters.dart';

class AddNoteCubit extends Cubit<AddNotesState> {
  AddNoteCubit() : super(NotesInitial());

  addNote(NoteModel note) async {
    emit(AddNoteloading());
    try {
      var notebox = Hive.box<NoteModel>('notes');
      await notebox.add(note);
      emit(NoteSuccess());
    } catch (e) {
      emit(NoteFailure(e.toString()));
    }
  }
}
