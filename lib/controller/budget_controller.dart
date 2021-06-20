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
    _budgetList = await DatabaseHelper.instance.getBudgetList();
    if (_budgetList.isNotEmpty) {
      _isUserIntroduced = true;
    } else {
      _isUserIntroduced = false;
    }
    print(_isUserIntroduced);
    update();
    super.onInit();
  }

  void introduceUser(Budget newBudget) async {
    await DatabaseHelper.instance.insertBudget(newBudget);
    _budgetList = await DatabaseHelper.instance.getBudgetList();
    print('new budget inserted');
    print(_budgetList);
    update();
  }

  void addMoney(int amount) async {
    await DatabaseHelper.instance.addToBudget(_budgetList[0], amount);
    _budgetList = await DatabaseHelper.instance.getBudgetList();
    print("newAmount: ${_budgetList[0].budget}");
    update();
  }

  void removeMoney(int amount) async {
    await DatabaseHelper.instance.removeFromBudget(_budgetList[0], amount);
    _budgetList = await DatabaseHelper.instance.getBudgetList();
    print("newAmount: ${_budgetList[0].budget}");
    update();
  }
}
