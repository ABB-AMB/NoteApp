import 'package:bloc/bloc.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/Constants.dart';
import 'package:notes_app/models/NoteModel.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  List<NoteModel>? notesList;
  getNotes() {
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      notesList = noteBox.values.toList();
      emit(NoteSuccess());
    } catch (e) {
      print("error ${e.toString()}"); // TODO
    }
    // emit(NoteSuccess());
  }
}
