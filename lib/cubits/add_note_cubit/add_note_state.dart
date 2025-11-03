abstract class NotesState {}

class NotesInitial extends NotesState {}

class AddNoteloading extends NotesState {}

class NoteSuccess extends NotesState {}

class NoteFailure extends NotesState {
  final String errormessage;
  NoteFailure(this.errormessage);
}
