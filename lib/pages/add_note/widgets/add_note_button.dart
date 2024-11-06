import 'package:flutter/material.dart';

import '../../../util/app_colors.dart';
import '../../../util/strings.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: double.maxFinite,
          margin: const EdgeInsets.fromLTRB(10, 50, 10, 40),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(AppColors.RICH_BLACK),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            "Add Note",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontFamily: SANS_BOLD,
                fontSize: 14),
          )),
    );
  }
}
