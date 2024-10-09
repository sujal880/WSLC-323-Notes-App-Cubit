import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wslc_323_cubit/Cubit/notesstate.dart';
import 'package:wslc_323_cubit/database/dbhelper.dart';
import 'package:wslc_323_cubit/models/notesmodel.dart';

class NotesCubit extends Cubit<NotesState> {
  DbHelper dbHelper;
  NotesCubit({required this.dbHelper}) : super(NotesInitialState());

  addNotes(NotesModel notemodel) async {
    emit(NotesLoadingState());
    bool check = await dbHelper.addNotes(notemodel);
    if (check) {
      var notes = await dbHelper.fetchNotes();
      emit(NotesLoadedState(arrnotes: notes));
    } else {
      emit(NotesErrorState(error: "No Data Added"));
    }
  }

  getnotes() async {
    emit(NotesLoadingState());
    var notes = await dbHelper.fetchNotes();
    emit(NotesLoadedState(arrnotes: notes));
  }
}
