import 'package:diary/models/note.dart';
import 'package:diary/repository/notes_repo.dart';
import 'package:flutter/material.dart';

class NotesProvider with ChangeNotifier{
  List<Note> notes=[];
  getNotes() async{
    notes= await NotesRepository.getNotes();
    notifyListeners();
  }
  insert({required Note note}) async{
    await NotesRepository.insert(note:note );
    getNotes();
  }
    update({required Note note}) async {
      await NotesRepository.update(note: note);
      getNotes();
    }
    Future<bool> delete({required Note note}) async{
      await NotesRepository.delete(note:note);
      getNotes();
      return true;
    }
  }
