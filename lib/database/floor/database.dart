import 'dart:async';
import 'package:floor/floor.dart';
import 'package:todo_app/database/floor/dao.dart';
import '../model/note_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'database.g.dart';

@Database(version: 1, entities: [NoteModel])
abstract class AppDatabase extends FloorDatabase {
  NotesDao get dao;
}

// PROVIDES A SINGLETON INSTANCE THROUGHOUT THE APP
class DatabaseSingleton {
  static AppDatabase? _database;

  static Future<AppDatabase> getDatabase() async {
    _database ??= await $FloorAppDatabase
        .databaseBuilder('app_database.db')
        .build();
    return _database!;
  }
}