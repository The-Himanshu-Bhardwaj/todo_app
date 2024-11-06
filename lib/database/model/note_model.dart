import 'package:floor/floor.dart';

@Entity(tableName: 'NotesTable')
class NoteModel {
  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: 'Id')
  final int? id;

  @ColumnInfo(name: 'Title')
  final String? title;

  @ColumnInfo(name: 'IsComplete')
  final bool? isComplete;

  NoteModel({this.id, this.title, this.isComplete});

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['Id'],
      title: json['Title'],
      isComplete: json['IsComplete'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Title': title,
      'IsComplete': isComplete,
    };
  }
}
