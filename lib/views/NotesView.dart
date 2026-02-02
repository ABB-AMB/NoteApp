import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/CustomAppBar.dart';
import 'package:notes_app/views/widgets/CustomNoteItem.dart';
import 'package:notes_app/views/widgets/NoteItemsListView.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 50),
            CustomAppBar(),
            Expanded(child: NotesListView()),
          ],
        ),
      ),
    );
  }
}
