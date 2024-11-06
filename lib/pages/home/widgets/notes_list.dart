import 'package:flutter/material.dart';
import 'package:todo_app/database/model/note_model.dart';
import 'package:todo_app/pages/home/widgets/note_card.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key, required this.list});

  final List<NoteModel> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {

          final noteTitle = list[index].title!;
          final isComplete = list[index].isComplete!;
          final id = list[index].id!;

          return NoteCard(noteTitle: noteTitle, isComplete: isComplete, id: id);
        });
  }
}
