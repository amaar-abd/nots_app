abstract class NotesState {}

class NotesInitial extends NotesState {}

class Noteloading extends NotesState {}

class NoteSuccess extends NotesState {}

class NoteFailure extends NotesState {
  final String errormessage;
  NoteFailure({required this.errormessage});
}
