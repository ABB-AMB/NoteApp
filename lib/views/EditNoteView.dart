import 'package:flutter/material.dart';
import 'package:notes_app/models/NoteModel.dart';
import 'package:notes_app/views/widgets/EditNoteViewBody.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:  EditNoteViewBody(note: note,));
  }
}
