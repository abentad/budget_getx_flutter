// ignore: import_of_legacy_library_into_null_safe
import 'package:budget_tracker/helper/database_helper.dart';
import 'package:budget_tracker/model/budget.dart';
import 'package:get/get.dart';

class BudgetController extends GetxController {
  List<Budget> _budgetList = [];
  bool _isUserIntroduced = false;

  bool get isUserIntroduced => _isUserIntroduced;
  List<Budget> get budgetList => _budgetList;

  @override
  void onInit() async {
    // updateBudgetList();
    _budgetList = await DatabaseHelper.instance.getBudgetList();
    // print("on budgetController on init: ${_budgetList[0]}");
    if (_budgetList.isNotEmpty) {
      _isUserIntroduced = true;
    } else {
      _isUserIntroduced = false;
    }
    print(_isUserIntroduced);
    update();
    super.onInit();
  }

  void updateBudgetList() async {
    _budgetList = await DatabaseHelper.instance.getBudgetList();
    update();
  }

  // Future<bool> isIntroduced() async {
  //   if (_budgetList.isNotEmpty) {
  //     return true;
  //   }
  //   return false;
  // }

  void introduceUser(Budget newBudget) async {
    int result = await DatabaseHelper.instance.insertBudget(newBudget);
    _budgetList = await DatabaseHelper.instance.getBudgetList();
    print('new budget inserted');
    print(_budgetList);
    update();
  }
}
