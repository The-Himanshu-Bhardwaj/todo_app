import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../util/app_colors.dart';
import '../../../util/show_toast.dart';
import '../provider/home_provider.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.noteTitle, required this.isComplete, required this.id});

  final String noteTitle;
  final bool isComplete;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onLongPress: () async {
              final provider = Provider.of<HomeProvider>(context, listen: false);
              final deleted = await provider.deleteNote(id);
              if (deleted) {
                showToast('Note Deleted');
              }
              else {
                showToast('Something went wrong');
              }

            },
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black45, width: 0.5)
              ),
              child: Text(noteTitle),
            ),
          ),
        ),

        Checkbox(
            checkColor: Colors.white,
            activeColor: const Color(AppColors.RICH_BLACK),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            value: isComplete,
            onChanged: (value) async {
              final provider = Provider.of<HomeProvider>(context, listen: false);
              final hasUpdated = await provider.changeCompleteStatus(id, value!);
              if (hasUpdated) {
                showToast('Status changed');
              }
              else {
                showToast('Something went wrong');
              }
            })
      ],
    );
  }
}
