part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

class NotesInitial extends NotesState {}

class NotesLoading extends NotesState {}

class NotesSuccess extends NotesState {
  final List<NoteModel> notes;
  NotesSuccess({required this.notes});
}

class Notesfaliure extends NotesState {
  final String messageerror;
  Notesfaliure(this.messageerror);
}
