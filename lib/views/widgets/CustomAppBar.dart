import 'package:MyNotes/views/widgets/CustomSearchIcon.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.icon, this.onTap});
  final String title;
  final  icon;
    final void Function()? onTap;
 
  @override
  Widget build(BuildContext context) {
    return  Row(
      children:  [
        Text(title, style: TextStyle(fontSize: 28)),
        Spacer(),
        CustomeSearchIcon(icon : icon , onTap: onTap,),
      ],
    );
  }
}
