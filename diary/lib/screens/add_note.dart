import 'package:diary/models/note.dart';
import 'package:diary/providers/notes_provider.dart';
import 'package:diary/repository/notes_repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNote extends StatefulWidget{
  final Note? note;
  const AddNote({super.key,this.note});

  @override 
  State<AddNote> createState()=> _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final _title=TextEditingController();
  final _description=TextEditingController();

  @override 
  void initState(){
    if(widget.note!=null)
    {
      _title.text=widget.note!.title;
      _description.text=widget.note!.description;
    }
  }
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar:AppBar(
        title: const Text('Add Note'),
        actions:[IconButton(onPressed:widget.note==null? _insertNote:_updateNote,
        icon: const Icon(Icons.done)),
        widget.note !=null? IconButton(onPressed: (){
          showDialog(context: context, builder:(context)=> AlertDialog(
            content: const Text('Are you sure you want to delete this note?'),
            actions:[TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child:const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _deleteNote();
              },
              child:const Text('Yes'),
            )]
          ));
        }, icon: const Icon(Icons.delete_outline)):const SizedBox()]
      ),
      body:Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: _title,
              decoration: InputDecoration(
              hintText: 'Title',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
            ),),
            const SizedBox(height:15),
            Expanded(
              child: TextField(
                controller: _description,
                decoration: InputDecoration(
                hintText: 'Start typing here...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
              ),
              maxLines:50,
              ),
            )
          ]
        ),
      )
    );
  }
  _insertNote() async{
    final note=Note(
      title: _title.text,
      description:_description.text,
      createdAt: DateTime.now());
    Provider.of<NotesProvider>(context,listen:false).insert(note:note);
  }
  _updateNote() async{
    final note=Note(
      id:widget.note!.id!,
      title: _title.text,
      description:_description.text,
      createdAt: widget.note!.createdAt,
    );
    Provider.of<NotesProvider>(context,listen: false).update(note:note);
  }
  _deleteNote() async{
    Provider.of<NotesProvider>(context,listen: false).update(note:widget.note!).then((idDone){});
    Navigator.pop(context);
  }
}