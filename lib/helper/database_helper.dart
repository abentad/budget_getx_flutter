// @dart=2.9
import 'dart:io';
import 'package:budget_tracker/model/budget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final String tableName = 'todo';
final String columnUserName = 'name';
final String columnBudget = 'budget';

class DatabaseHelper {
  static Database _db;

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
        create table $tableName (
          $columnUserName text primary key not null,
          $columnBudget integer not null)
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
    return result;
  }

  Future<int> updateBudget(Budget budget) async {
    Database db = await this.db;
    final int result = await db.update(tableName, budget.toMap(), where: "$columnUserName = ?", whereArgs: [budget.name]);
    return result;
  }

  Future<int> deleteBudget(String name) async {
    Database db = await this.db;
    final int result = await db.delete(tableName, where: "$columnUserName = ?", whereArgs: [name]);
    return result;
  }
}
