

import 'package:MyNotes/Constants.dart';
import 'package:MyNotes/models/NoteModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce/hive.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  List<NoteModel>? notesList;
  getNotes() {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      notesList = noteBox.values.toList();
      emit(NoteSuccess());
   
    // emit(NoteSuccess());
  }
}
