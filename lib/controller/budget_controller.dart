import 'package:budget_tracker/model/budget.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class BudgetController extends GetxController {}

class BudgetDatabase {
  String tableName = "Budget";

  void openDb() async {
    var db = await openDatabase(
      "budget.db",
      version: 2,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute('CREATE TABLE $tableName(id INTEGER PRIMARY KEY, name TEXT, budget INTEGER)');
      },
    );
  }
}
