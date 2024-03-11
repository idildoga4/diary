import 'package:diary/colors.dart';
import 'package:diary/models/note.dart';
import 'package:diary/screens/add_note.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemNote extends StatelessWidget{
  final Note note;
  const ItemNote({super.key,required this.note});

  @override 
  Widget build(BuildContext context)
  {
    ColorsPalette myColors= ColorsPalette();
    return GestureDetector(
      onTap:() {
        Navigator.push(context,MaterialPageRoute(builder:(_) => AddNote(note:note)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical:5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: myColors.powderblue,),
        
              child:Column(
                children:[
                  
          Text(DateFormat(DateFormat.ABBR_MONTH).format(note.createdAt),style: TextStyle(color:Colors.white)
          ),
          const SizedBox(height:3),
          Text(DateFormat(DateFormat.MONTH_DAY).format(note.createdAt),style:Theme.of(context).textTheme.titleLarge?.copyWith(
            color:Colors.white,
            fontWeight: FontWeight.bold
          )
           ),
          Text(DateFormat(DateFormat.YEAR).format(note.createdAt),style: TextStyle(color: Colors.white)
          ),
      
        const SizedBox(width:15),
        Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(note.title,style: Theme.of(context).textTheme.titleMedium,maxLines: 1,overflow:TextOverflow.ellipsis)),
            Text(DateFormat(DateFormat.HOUR_MINUTE).format(note.createdAt),style: Theme.of(context).textTheme.bodySmall)
          ],
        ),
        Text(note.description,style:const TextStyle(fontWeight:FontWeight.w300,height:1.5),maxLines:3,overflow:TextOverflow.ellipsis)
         
      ],
      ),
      ),
      ],
      ),
      ),
    );
  }
}