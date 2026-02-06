import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/CustomAppBar.dart';
import 'package:notes_app/views/widgets/CustomTextField.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: const [
          SizedBox(height: 50),
          CustomAppBar(title: "Edit Note", icon: Icons.check),
          SizedBox(height: 24),
          CustomTextField(hint: "Title"),
          SizedBox(height: 18),
          CustomTextField(hint: "Content", maxLines: 5),
        ],
      ),
    );
  }
}
