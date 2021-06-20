import 'package:budget_tracker/controller/budget_controller.dart';
import 'package:budget_tracker/home_screen.dart';
import 'package:budget_tracker/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  BudgetController _budgetController = Get.find<BudgetController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BudgetController>(
      init: BudgetController(),
      builder: (controller) {
        _budgetController.isUserIntroduced ? HomeScreen() : IntroScreen();
      },
    );
  }
}
