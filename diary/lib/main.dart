import 'package:diary/providers/notes_provider.dart';
import 'package:diary/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) 
  {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_)=> NotesProvider())
      ],
      child:const MaterialApp(
      title: 'My Diary',
      debugShowCheckedModeBanner:false,
      
      home: HomeScreen()
    ));
  }
}

