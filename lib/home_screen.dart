import 'package:budget_tracker/add_screen.dart';
import 'package:budget_tracker/controller/budget_controller.dart';
import 'package:budget_tracker/remove_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final BudgetController _budgetController = Get.find<BudgetController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: GetBuilder<BudgetController>(
          builder: (controller) => Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi \n${_budgetController.budgetList[0].name}",
                  style: TextStyle(fontSize: 42.0, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: size.height * 0.04),
                Text(
                  "Your Total Budget is:",
                  style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: size.height * 0.1),
                Text(
                  "${_budgetController.budgetList[0].budget.toString()} Birr",
                  style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.w600, color: Colors.teal),
                ),
                SizedBox(height: size.height * 0.08),
                MaterialButton(
                  onPressed: () => Get.to(() => AddScreen(), transition: Transition.cupertino),
                  height: 50.0,
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  color: Color(0xff39A6A3),
                  child: Text("Add", style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, color: Colors.white)),
                ),
                SizedBox(height: size.height * 0.02),
                MaterialButton(
                  onPressed: () => Get.to(() => RemoveScreen(), transition: Transition.cupertino),
                  height: 50.0,
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  color: Color(0xffF54748),
                  child: Text("Remove", style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
