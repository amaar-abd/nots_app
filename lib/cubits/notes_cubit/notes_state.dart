part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

 class NotesInitial extends NotesState {}
 class NotesLoading extends NotesState {}
 class NotesSuccess extends NotesState {}
 
 class Notesfaliure extends NotesState {
  final String messageerror ;
  Notesfaliure({required this.messageerror});
 }
