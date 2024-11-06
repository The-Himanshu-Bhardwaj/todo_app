import 'package:todo_app/database/model/note_model.dart';

import '../../../database/floor/database.dart';

class NoteRepo {

  // ADDS A NOTE TO THE DATABASE
  Future<bool> addNote(String noteTitle) async {

    try {
      final AppDatabase database = await DatabaseSingleton.getDatabase();
      final notesDao = database.dao;

      final model = NoteModel(id: null, title: noteTitle, isComplete: false);

      await notesDao.insertNote(model);
      return true;
    } catch (e) {
      return false;
    }


  }
}