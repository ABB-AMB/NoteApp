import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Constants.dart';
import 'package:notes_app/Cubits/AddNoteCubit/add_note_cubit_cubit.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;
  
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
              BlocProvider.of<AddNoteCubitCubit>(context).color =
                  kColor[index];
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

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.color, required this.isSelected});
  final Color color;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
          radius: 38,
          backgroundColor: Colors.white,
          child: CircleAvatar(radius: 34, backgroundColor: color),
        )
        : CircleAvatar(radius: 34, backgroundColor: color);
  }
}
