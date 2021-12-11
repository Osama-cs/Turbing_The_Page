import 'package:individualproject/model/diary.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DiaryDatabase {
  static final DiaryDatabase instance = DiaryDatabase._init();

  static Database? _database;

  DiaryDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('diary.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();

    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE $tableDiary (
  ${DiaryFields.id} $idType,
  ${DiaryFields.diaryTime} $textType,
  ${DiaryFields.diaryTitle} $textType,
  ${DiaryFields.diaryDescription} $textType
  ) 
''');
  }

  Future<Diary> create(Diary diary) async {
    final db = await instance.database;

    final id = await db.insert(tableDiary, diary.toJson());
    return diary.copy(id: id);
  }

  Future<Diary> readDiary(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableDiary,
      columns: DiaryFields.values,
      where: '${DiaryFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Diary.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Diary>> readAllDiaries() async {
    final db = await instance.database;

    final orderBy = '${DiaryFields.diaryTime} ASC';

    final result = await db.query(tableDiary, orderBy: orderBy);

    return result.map((json) => Diary.fromJson(json)).toList();
  }

  Future<int> update(Diary diary) async {
    final db = await instance.database;

    return db.update(
      tableDiary,
      diary.toJson(),
      where: '${DiaryFields.id} = ?',
      whereArgs: [diary.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return db.delete(
      tableDiary,
      where: '${DiaryFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
