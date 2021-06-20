// @dart=2.9
import 'dart:io';
import 'package:budget_tracker/model/budget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final String tableName = 'budgetTable';
final String columnId = "id";
final String columnUserName = 'name';
final String columnBudget = 'budget';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database _db;
  DatabaseHelper._instance();

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "budget.db";
    final budgetDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return budgetDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE $tableName (
          $columnId INTEGER PRIMARY KEY,
          $columnUserName TEXT NOT NULL,
          $columnBudget INTEGER NOT NULL)
    ''');
  }

  Future<List<Map<String, dynamic>>> getBudgetMapList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db.query(tableName);
    return result;
  }

  Future<List<Budget>> getBudgetList() async {
    List<Map<String, dynamic>> budgetMapList = await getBudgetMapList();
    final List<Budget> budgetList = [];
    budgetMapList.forEach((budgetMap) {
      budgetList.add(Budget.fromMap(budgetMap));
    });
    return budgetList;
  }

  Future<int> insertBudget(Budget budget) async {
    Database db = await this.db;
    final int result = await db.insert(tableName, budget.toMap());
    print("$budget has been inserted");
    return result;
  }

  Future<int> updateBudget(Budget budget) async {
    Database db = await this.db;
    final int result = await db.update(tableName, budget.toMap(), where: "$columnId = ?", whereArgs: [budget.id]);
    return result;
  }

  Future<int> deleteBudget(int id) async {
    Database db = await this.db;
    final int result = await db.delete(tableName, where: "$columnId = ?", whereArgs: [id]);
    return result;
  }
}
