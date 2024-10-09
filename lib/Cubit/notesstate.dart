import 'package:wslc_323_cubit/models/notesmodel.dart';

abstract class NotesState {}

class NotesInitialState extends NotesState {}

class NotesLoadingState extends NotesState {}

class NotesLoadedState extends NotesState {
  List<NotesModel>? arrnotes = [];
  int? id;
  NotesLoadedState({this.arrnotes, this.id});
}

class NotesErrorState extends NotesState {
  String error;
  NotesErrorState({required this.error});
}
