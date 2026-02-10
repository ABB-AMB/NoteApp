import 'package:MyNotes/Constants.dart';
import 'package:MyNotes/models/NoteModel.dart';
import 'package:MyNotes/views/widgets/ColorsListView.dart';
import 'package:flutter/material.dart';

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