import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wslc_323_cubit/Cubit/notescubit.dart';
import 'package:wslc_323_cubit/Cubit/notesstate.dart';
import 'package:wslc_323_cubit/Screens/adddatascreen.dart';

class NotesAppScreen extends StatelessWidget {
  const NotesAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes App"),
        centerTitle: true,
      ),
      body: BlocBuilder<NotesCubit,NotesState>(builder: (context,state){
        if(state is NotesLoadingState){
          return Center(child: CircularProgressIndicator(),);
        }
        else if(state is NotesErrorState){
          return Center(child: Text(state.error.toString()),);
        }
        else if(state is NotesLoadedState){
          return ListView.builder(itemBuilder: (context,index){
            return ListTile(
             leading: Text("${index+1}"),
             title: Text(state.arrnotes![index].title),
             subtitle: Text(state.arrnotes![index].desc),
            );
          },itemCount: state.arrnotes!.length,);
        }
        return Center(child: Text("Add Notes"),);
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddDataScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
