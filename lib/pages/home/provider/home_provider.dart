import 'package:flutter/material.dart';
import 'package:todo_app/database/model/note_model.dart';
import 'package:todo_app/util/sleep.dart';
import '../../../database/floor/database.dart';

class HomeProvider extends ChangeNotifier {

  bool _isLoading = true;
  bool _hasError = false;
  List<NoteModel>? _notesList;

  List<NoteModel>? get notesList => _notesList;
  bool get hasError => _hasError;
  bool get isLoading => _isLoading;

  // MARKS A NOTE AS COMPLETE/INCOMPLETE
  Future<bool> changeCompleteStatus(int id, bool value) async {
    try {
      final AppDatabase database = await DatabaseSingleton.getDatabase();
      final notesDao = database.dao;
      await notesDao.changeNoteCompleteStatus(id, value);
      await populateNotes();
      return true;
    } catch (e) {
      return false;
    }
  }

  // DELETES A NOTE
  Future<bool> deleteNote(int id) async {
    try {
      final AppDatabase database = await DatabaseSingleton.getDatabase();
      final notesDao = database.dao;
      await notesDao.deleteNote(id);
      await populateNotes();
      return true;
    } catch (e) {
      return false;
    }
  }

  // LOADS ALL NOTES
  Future<void> populateNotes() async {

    _notesList = null;
    _isLoading = true;
    _hasError = false;
    notifyListeners();

    // DELAY FOR SMOOTH TRANSITIONS
    await sleepForMilliseconds(300);

    final AppDatabase database = await DatabaseSingleton.getDatabase();
    final notesDao = database.dao;

    final notesResponse = await notesDao.getAllNotes();

    // WHEN NO NOTES ARE AVAILABLE
    if (notesResponse == null || notesResponse.isEmpty) {
      _hasError = true;
    }
    // WHEN DATA IS PRESENT
    else {
      _hasError = false;
      _notesList = notesResponse;
    }

    _isLoading = false;
    notifyListeners();


  }

}