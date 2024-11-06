import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../util/app_colors.dart';
import '../../../util/strings.dart';

class AddNoteFab extends StatelessWidget {
  const AddNoteFab({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        tooltip: 'Add a new case record',
        icon: const Padding(
          padding: EdgeInsets.only(right: 5),
          child: FaIcon(
            size: 15,
            FontAwesomeIcons.folderPlus,
            color: Colors.white,
          ),
        ),
        backgroundColor:  const Color(AppColors.RICH_BLACK),
        onPressed: onPressed,
        label: const Text(
          'Add Note',
          style: TextStyle(fontFamily: SANS_BOLD, fontSize: 13, color: Colors.white),
        ));
  }
}
