import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/CustomSearchIcon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: const [
        Text("Notes", style: TextStyle(fontSize: 28)),
        Spacer(),
        CustomeSearchIcon(),
      ],
    );
  }
}
