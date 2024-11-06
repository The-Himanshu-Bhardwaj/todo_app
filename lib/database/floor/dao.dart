import 'package:floor/floor.dart';
import 'package:todo_app/database/model/note_model.dart';

@dao
abstract class NotesDao {

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertNote(NoteModel note);

  @Query('select * from NotesTable order by IsComplete')
  Future<List<NoteModel>?> getAllNotes();

  @Query('update NotesTable set IsComplete = :value where id = :id')
  Future<void> changeNoteCompleteStatus(int id, bool value);

  @Query('delete from NotesTable where id = :id')
  Future<void> deleteNote(int id);

}