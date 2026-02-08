import 'package:bloc/bloc.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/Constants.dart';
import 'package:notes_app/models/NoteModel.dart';

part 'add_note_cubit_state.dart';

class AddNoteCubitCubit extends Cubit<AddNoteCubitState> {
  AddNoteCubitCubit() : super(AddNoteCubitInitial());

  add(NoteModel note) async{
    emit(AddNoteCubitLoadding());
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(note);
      emit(AddNoteCubitSuccess());
    } catch (e) {
      emit(AddNoteCubitFailuer(errMessage: e.toString()));
    }
  }
}
