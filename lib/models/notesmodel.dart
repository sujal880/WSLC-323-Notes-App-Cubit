
import '../database/dbhelper.dart';

class NotesModel {
  int? noteid;
  String title;
  String desc;
  NotesModel({required this.title, required this.desc, this.noteid});

  factory NotesModel.fromMap(Map<String, dynamic> mapdata) {
    return NotesModel(
        title: mapdata[DbHelper.Note_columntitle],
        desc: mapdata[DbHelper.Note_columndesc],
        noteid: mapdata[DbHelper.Note_columnid]);
  }

  Map<String,dynamic>toMap(){
    return {
      DbHelper.Note_columntitle:title,
      DbHelper.Note_columndesc:desc,
      DbHelper.Note_columnid:noteid
    };
  }
}
