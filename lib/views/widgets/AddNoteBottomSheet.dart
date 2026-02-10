import 'package:MyNotes/Cubits/AddNoteCubit/add_note_cubit.dart';
import 'package:MyNotes/Cubits/note_cubit/note_cubit.dart';
import 'package:MyNotes/views/widgets/NoteForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocConsumer<AddNoteCubit, AddNoteCubitState>(
          listener: (context, state) {
            if (state is AddNoteCubitSuccess) {
              BlocProvider.of<NoteCubit>(context).getNotes();
              Navigator.of(context).pop();
            }
            if (state is AddNoteCubitFailuer) {
              print(state.errMessage);
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is AddNoteCubitLoadding ? true : false,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SingleChildScrollView(child: NoteForm()),
              ),
            );
          },
        ),
      ),
    );
  }
}
