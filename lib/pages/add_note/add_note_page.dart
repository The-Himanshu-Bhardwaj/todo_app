import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app/pages/add_note/repo/note_repo.dart';
import 'package:todo_app/pages/add_note/widgets/add_note_button.dart';
import 'package:todo_app/util/show_toast.dart';
import 'widgets/custom_text_field.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {

  final _noteField = TextEditingController();
  final _focusNode = FocusNode();
  final _noteRepo = NoteRepo();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200), () {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _noteField.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Add Note'),
          ),

          body: Column(
            children: [

              // TEXT FIELD
              CustomTextFields(
                hint: 'Add note',
                focusNode: _focusNode,
                icon: FontAwesomeIcons.notesMedical,
                controller: _noteField,
              ),

              const Spacer(),

              // ADD BUTTON
              AddNoteButton(

                onPressed: () async {

                  // WHEN EMPTY -> RETURNS
                  final noteTitle = _noteField.text.trim();
                  if (noteTitle.isEmpty) {
                    showToast('Note cannot be empty');
                    return;
                  }

                  // SAVING IN LOCAL WHEN NOT EMPTY
                  final noteSaved = await _noteRepo.addNote(noteTitle);
                  if (noteSaved) {
                    showToast('Note Saved !');
                    if (context.mounted) Navigator.pop(context);
                  }
                  else {
                    showToast('Something went wrong');
                  }
                },
              )
            ],
          ),



        )
    );
  }
}
