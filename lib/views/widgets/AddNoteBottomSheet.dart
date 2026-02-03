import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/CustomBotton.dart';
import 'package:notes_app/views/widgets/CustomTextField.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 32),
            CustomTextField(hint: "Titel"),
            SizedBox(height: 16),
            CustomTextField(hint: "Content", maxLines: 5),
            SizedBox(height: 40),
            CustomBotton(),
            SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}
