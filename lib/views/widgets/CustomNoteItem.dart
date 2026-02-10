import 'package:MyNotes/Cubits/note_cubit/note_cubit.dart';
import 'package:MyNotes/models/NoteModel.dart';
import 'package:MyNotes/views/EditNoteView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => EditNoteView(note: note,)));
      },
      child: Container(
        padding: EdgeInsets.only(top: 24, bottom: 24, left: 24),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  note.content,
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NoteCubit>(context).getNotes();
                },
                icon: Icon(
                  Icons.delete,
                  size: 30,
                  color: Colors.black.withOpacity(.8),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0, top: 16),
              child: Text(
                note.date,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
