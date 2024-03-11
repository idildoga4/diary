import 'package:diary/colors.dart';
import 'package:diary/providers/notes_provider.dart';
import 'package:diary/repository/notes_repo.dart';
import 'package:diary/screens/add_note.dart';
import 'package:diary/widgets/notes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});
  @override 
  State<HomeScreen> createState()=> _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>
{
  ColorsPalette myColors= ColorsPalette();

  @override 
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar:AppBar(
        title: const Text('My Diary'),
        centerTitle: true, 
        actions:[
          IconButton(onPressed: ()=> setState(() {}), icon: const Icon(Icons.refresh))
        ]
      ),
      body: Consumer<NotesProvider>(
        builder: (context,provider,child)
        {
          return provider.notes.isEmpty? const Center(child:Text('Empty')): ListView(
            children: provider.notes.map((e)=> ItemNote(note:e)).toList(),
          );
        }
      ),
        
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          Navigator.push(context,MaterialPageRoute(builder: (_)=> const AddNote()));
        },
        backgroundColor: myColors.buttons,
        foregroundColor: Colors.black,
        child:const Icon(Icons.add),
      ),
    );
  }
}