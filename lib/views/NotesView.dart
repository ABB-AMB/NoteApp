
import 'package:MyNotes/Constants.dart';
import 'package:MyNotes/Cubits/note_cubit/note_cubit.dart';
import 'package:MyNotes/views/widgets/AddNoteBottomSheet.dart';
import 'package:MyNotes/views/widgets/CustomAppBar.dart';
import 'package:MyNotes/views/widgets/NoteItemsListView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  void initState() {
    BlocProvider.of<NoteCubit>(context).getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return const AddNoteBottomSheet();
            },
          );
        },
        child: Icon(Icons.add, color: Colors.black),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 50),
            CustomAppBar(title: "Note App", icon: Icons.search),
            Expanded(child: NotesListView()),
          ],
        ),
      ),
    );
  }
}
