import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Cubits/note_cubit/note_cubit.dart';
import 'package:notes_app/models/NoteModel.dart';
import 'package:notes_app/views/widgets/CustomAppBar.dart';
import 'package:notes_app/views/widgets/CustomTextField.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 50),
          CustomAppBar(
            title: "Edit Note",
            icon: Icons.check,
            onTap: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.content = content ?? widget.note.content;
              BlocProvider.of<NoteCubit>(context).getNotes();
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 24),
          CustomTextField(
            hint: widget.note.title,
            onChanged: (p0) {
              title = p0;
            },
          ),
          const SizedBox(height: 18),
          CustomTextField(
            hint: widget.note.content,
            onChanged: (p0) {
              content = p0;
            },
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
