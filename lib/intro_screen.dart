import 'package:budget_tracker/controller/budget_controller.dart';
import 'package:budget_tracker/home_screen.dart';
import 'package:budget_tracker/model/budget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroScreen extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _budgetAmountController = TextEditingController();

  BudgetController _budgetController = Get.find<BudgetController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.05),
              Text("Hi \nTell us...", style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w600)),
              SizedBox(height: size.height * 0.03),
              TextFormField(
                controller: _nameController,
                cursorColor: Colors.black,
                style: TextStyle(fontSize: 18.0, color: Colors.black),
                decoration: InputDecoration(
                  hintText: "username",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              TextFormField(
                controller: _budgetAmountController,
                decoration: InputDecoration(
                  hintText: "budget",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              MaterialButton(
                onPressed: () async {
                  Budget newBudget = Budget(id: 0, name: _nameController.text, budget: int.parse("${_budgetAmountController.text}"));
                  _budgetController.introduceUser(newBudget);
                  await Future.delayed(const Duration(seconds: 2), () {
                    Get.offAll(() => HomeScreen(), transition: Transition.cupertino);
                  });
                },
                height: 50.0,
                minWidth: double.infinity,
                color: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                child: Text('Continue', style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
