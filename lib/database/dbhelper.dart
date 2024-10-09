import 'dart:developer';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:wslc_323_cubit/models/notesmodel.dart';
class DbHelper {
  static final DbHelper db = DbHelper(); // Singleton Class
  Database? _database; // Private Variable
  static const Note_table = "notes_table";
  static const Note_columnid = "note_id";
  static const Note_columntitle = "note_title";
  static const Note_columndesc = "note_desc";

  Future<Database> getDb() async {
    if (_database != null) {
      return _database!;
    } else {
      return await initDb();
    }
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    var dbpath = join(directory.path + "newnotes.db");
    return openDatabase(dbpath, version: 1, onCreate: (db, version) {
      db.execute(
          "create table $Note_table ( $Note_columnid integer primary key autoincrement, $Note_columntitle text, $Note_columndesc text ) ");
    });
  }

  Future<bool>addNotes(NotesModel newnote)async{
    var db=await getDb();
    int rowseffect=await db.insert(Note_table, newnote.toMap());
    log(rowseffect.toString());
    return rowseffect>0; // 0 False 1 True
  }

  Future<List<NotesModel>>fetchNotes()async{
    var db=await getDb();
    List<Map<String,dynamic>>notes=await db.query(Note_table);
    List<NotesModel>listnotes=[];
    for(Map<String,dynamic>notemodel in notes){
      NotesModel getnotes=NotesModel.fromMap(notemodel);
      listnotes.add(getnotes);
    }
    return listnotes;
  }
}
