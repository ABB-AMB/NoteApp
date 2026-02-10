import 'package:MyNotes/Cubits/note_cubit/note_cubit.dart';
import 'package:MyNotes/models/NoteModel.dart';
import 'package:MyNotes/views/widgets/CustomNoteItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NoteCubit>(context).notesList ?? [];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return  Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child:NoteItem(note: notes[index],),
              );
            },
          ),
        );
      },
    );
  }
}
