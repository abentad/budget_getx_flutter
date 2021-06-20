// ignore: import_of_legacy_library_into_null_safe
import 'package:budget_tracker/helper/database_helper.dart';
import 'package:budget_tracker/model/budget.dart';
import 'package:get/get.dart';

class BudgetController extends GetxController {
  List<Budget> _budgetList = [];

  @override
  void onInit() async {
    // updateBudgetList();
    _budgetList = await DatabaseHelper.instance.getBudgetList();
    print(_budgetList);
    update();
    super.onInit();
  }

  void updateBudgetList() async {
    _budgetList = await DatabaseHelper.instance.getBudgetList();
    update();
  }

  void introduceUser(Budget newBudget) async {
    int result = await DatabaseHelper.instance.insertBudget(newBudget);
    updateBudgetList();
    print('new budget inserted');
    print(_budgetList);
    update();
  }
}
