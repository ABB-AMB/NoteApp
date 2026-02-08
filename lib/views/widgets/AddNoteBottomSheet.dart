import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/Cubits/AddNoteCubit/add_note_cubit_cubit.dart';
import 'package:notes_app/views/widgets/NoteForm.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubitCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocConsumer<AddNoteCubitCubit, AddNoteCubitState>(
          listener: (context, state) {
            if (state is AddNoteCubitSuccess) {
              Navigator.of(context).pop();
            }
            if (state is AddNoteCubitFailuer) {
              print(state.errMessage);
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is AddNoteCubitLoadding ? true :false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(child: NoteForm()),
              ),
            );
          },
        ),
      ),
    );
  }
}
