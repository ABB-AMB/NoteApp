import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:notes_app/Constants.dart';
import 'package:notes_app/Cubits/AddNoteCubit/add_note_cubit_cubit.dart';
import 'package:notes_app/Cubits/note_cubit/note_cubit.dart';
import 'package:notes_app/SimpleBlocObserver.dart';
import 'package:notes_app/models/NoteModel.dart';
import 'package:notes_app/views/NotesView.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.initFlutter();
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => NoteCubit())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, fontFamily: "Poppins"),
        home: NotesView(),
      ),
    );
  }
}
