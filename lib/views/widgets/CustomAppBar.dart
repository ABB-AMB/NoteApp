import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/CustomSearchIcon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.icon});
  final String title;
  final  icon;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children:  [
        Text(title, style: TextStyle(fontSize: 28)),
        Spacer(),
        CustomeSearchIcon(icon : icon),
      ],
    );
  }
}
