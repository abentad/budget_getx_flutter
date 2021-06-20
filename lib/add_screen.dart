import 'package:budget_tracker/controller/budget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddScreen extends StatelessWidget {
  final BudgetController _budgetController = Get.find<BudgetController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add Amount", style: TextStyle(fontSize: 34.0, color: Colors.black, fontWeight: FontWeight.w600)),
              SizedBox(height: size.height * 0.02),
              GetBuilder<BudgetController>(
                builder: (controller) => Text("Your total: ${controller.budgetList[0].budget}", style: TextStyle(fontSize: 26.0, color: Colors.teal, fontWeight: FontWeight.w600)),
              ),
              SizedBox(height: size.height * 0.05),
              buildMaterialButton(amountTobeAdded: 50),
              SizedBox(height: size.height * 0.03),
              buildMaterialButton(amountTobeAdded: 100),
              SizedBox(height: size.height * 0.03),
              buildMaterialButton(amountTobeAdded: 150),
              SizedBox(height: size.height * 0.03),
              buildMaterialButton(amountTobeAdded: 200),
              SizedBox(height: size.height * 0.03),
              MaterialButton(
                onPressed: () {
                  // _budgetController.addMoney(amountTobeAdded);
                },
                height: 80.0,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                color: Color(0xffFB9300),
                child: Text("Custom", style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  MaterialButton buildMaterialButton({required int amountTobeAdded}) {
    return MaterialButton(
      onPressed: () {
        _budgetController.addMoney(amountTobeAdded);
      },
      height: 80.0,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Colors.teal,
      child: Text("Add $amountTobeAdded Birr", style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.w600)),
    );
  }
}
