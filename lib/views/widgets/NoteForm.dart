import 'package:MyNotes/Cubits/AddNoteCubit/add_note_cubit.dart';
import 'package:MyNotes/models/NoteModel.dart';
import 'package:MyNotes/views/widgets/ColorsListView.dart';
import 'package:MyNotes/views/widgets/CustomBotton.dart';
import 'package:MyNotes/views/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class NoteForm extends StatefulWidget {
  NoteForm({super.key});

  @override
  State<NoteForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  String? title, content;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(height: 32),
          CustomTextField(
            hint: "Titel",
            onSaved: (value) {
              title = value;
            },
          ),
          SizedBox(height: 16),
          CustomTextField(
            hint: "Content",
            maxLines: 5,
            onSaved: (value) {
              content = value;
            },
          ),
          SizedBox(height: 32),
          ColorsListView(),
          SizedBox(height: 32),
          BlocBuilder<AddNoteCubit, AddNoteCubitState>(
            builder:
                (context, state) => CustomBotton(
                  isLoading: state is AddNoteCubitLoadding ? true : false,
                  onTap: () {
                    noteAddDone(context);
                  },
                ),
          ),
          SizedBox(height: 35),
        ],
      ),
    );
  }

  void noteAddDone(BuildContext context) {
    if (formKey.currentState!.validate()) {
      var date = DateTime.now();
      var formattedDate = DateFormat.yMd().format(date);
      formKey.currentState!.save();
      NoteModel note = NoteModel(
        title: title!,
        content: content!,
        date: formattedDate,
        color: Colors.blueAccent.value,
      );
      BlocProvider.of<AddNoteCubit>(context).add(note);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
