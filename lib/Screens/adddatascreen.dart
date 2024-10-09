import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wslc_323_cubit/Cubit/notescubit.dart';
import 'package:wslc_323_cubit/models/notesmodel.dart';
import 'package:wslc_323_cubit/widgets/uihelper.dart';

class AddDataScreen extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data Screen"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(titleController, "Enter Title", Icons.title),
          UiHelper.CustomTextField(
              descController, "Enter Description", Icons.description),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                addData(titleController.text.toString(),
                    descController.text.toString(), context);
              },
              child: Text("Save"))
        ],
      ),
    );
  }

  addData(String title, String desc, BuildContext context) {
    if (title == "" || desc == "") {
      return log("Enter Required Field's");
    } else {
      context.read<NotesCubit>().addNotes(NotesModel(title: title, desc: desc));
      log("Data Added");
    }
  }
}
