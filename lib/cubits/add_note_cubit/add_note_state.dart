abstract class AddNotesState {}

class NotesInitial extends AddNotesState {}

class AddNoteloading extends AddNotesState {}

class NoteSuccess extends AddNotesState {}

class NoteFailure extends AddNotesState {
  final String errormessage;
  NoteFailure(this.errormessage);
}
