import 'dart:ui';

import 'package:MyNotes/Constants.dart';
import 'package:MyNotes/models/NoteModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';


part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteCubitState> {
  AddNoteCubit() : super(AddNoteCubitInitial());
  Color color = Color(0xffef767a);
  add(NoteModel note) async {
    emit(AddNoteCubitLoadding());
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      note.color = color.value;
      await noteBox.add(note);
      emit(AddNoteCubitSuccess());
    } catch (e) {
      emit(AddNoteCubitFailuer(errMessage: e.toString()));
    }
  }
}
