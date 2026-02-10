import 'package:flutter/material.dart';
import 'package:notes_app/Constants.dart';
import 'package:notes_app/models/NoteModel.dart';
import 'package:notes_app/views/widgets/ColorsListView.dart';

class EditNoteColorsListView extends StatefulWidget {
  const EditNoteColorsListView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteColorsListView> createState() => _EditNoteColorsListViewState();
}

class _EditNoteColorsListViewState extends State<EditNoteColorsListView> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kColor.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              widget.note.color = kColor[currentIndex].value;
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ColorItem(
                color: kColor[index],
                isSelected: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}