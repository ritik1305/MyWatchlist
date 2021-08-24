// import 'dart:io';

// import 'package:mywatchlist/models/task_model.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseHelper {
//   static final DatabaseHelper instance = DatabaseHelper._instance();
//   static late Database _db;

//   DatabaseHelper._instance();

//   String tasksTable = 'task_tables';
//   String colId = 'id';
//   String colTitle = 'title';
//   String colDirector = 'director';
//   String colStatus = 'status';

//   Future<Database> get db async {
//     // ignore: unnecessary_null_comparison
//     if (_db == null) {
//       _db = await _initDb();
//     }
//     return _db;
//   }

//   Future<Database> _initDb() async {
//     Directory dir = await getApplicationDocumentsDirectory();
//     String path = dir.path + 'todo_list.db';
//     final todoListDb =
//         await openDatabase(path, version: 1, onCreate: _createDb);
//     return todoListDb;
//   }

//   void _createDb(Database db, int version) async {
//     await db.execute(
//       'CREATE TABLE $tasksTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT ,$colDirector TEXT, $colStatus INTEGER)',
//     );
//   }

//   Future<List<Map<String, dynamic>>> getTaskMapList() async {
//     Database db = await this.db;
//     final List<Map<String, dynamic>> result = await db.query(tasksTable);
//     return result;
//   }

//   Future<List<Task>> getTaskList() async {
//     final List<Map<String, dynamic>> taskMapList = await getTaskMapList();
//     final List<Task> taskList = [];
//     taskMapList.forEach((taskMap) {
//       taskList.add(Task.fromMap(taskMap));
//     });
//     return taskList;
//   }

//   Future<int> insertTask(Task task) async {
//     Database db = await this.db;
//     final int result = await db.insert(tasksTable, task.toMap());
//     return result;
//   }

//   Future<int> updateTask(Task task) async {
//     Database db = await this.db;
//     final int result = await db.update(tasksTable, task.toMap(),
//         where: '$colId = ?', whereArgs: [task.id]);
//     return result;
//   }

//   Future<int> deleteTask(int id) async {
//     Database db = await this.db;
//     final int result =
//         await db.delete(tasksTable, where: '$colId = ?', whereArgs: [id]);
//     return result;
//   }
// }
