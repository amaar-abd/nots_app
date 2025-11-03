import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';
// lib\cubits\notes_cubit\notes_state.dart
part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  featshAllNotes() async {
    try {
      var notebox = Hive.box<NoteModel>('notes');
      List<NoteModel> notes = notebox.values.toList();

      emit(NotesSuccess(notes: notes));
    } catch (e) {
      emit(Notesfaliure(e.toString()));
    }
  }
}
