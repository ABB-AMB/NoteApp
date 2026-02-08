import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:notes_app/Constants.dart';
import 'package:notes_app/models/NoteModel.dart';
import 'package:notes_app/views/NotesView.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
   Hive.registerAdapter(NoteModelAdapter());
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, fontFamily: "Poppins"),
      home: NotesView(),
    );
  }
}
