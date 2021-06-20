import 'package:budget_tracker/add_screen.dart';
import 'package:budget_tracker/controller/budget_controller.dart';
import 'package:budget_tracker/remove_screen.dart';
import 'package:budget_tracker/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final BudgetController _budgetController = Get.find<BudgetController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: _budgetController.budgetList.isEmpty
      //     ? null
      //     : AppBar(
      //         backgroundColor: Colors.transparent,
      //         shadowColor: Colors.transparent,
      //         title: Text("Budgetor", style: TextStyle(color: Colors.black)),
      //       ),
      drawer: Drawer(),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.teal.shade200, offset: Offset(2, 7), blurRadius: 10.0)],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: GetBuilder<BudgetController>(
                  builder: (controller) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        child: Center(
                          child: Stack(
                            children: [
                              Container(
                                height: 100.0,
                                width: 100.0,
                                child: CircularProgressIndicator(
                                  color: Colors.teal,
                                  backgroundColor: Color(0xffe1e1e1),
                                  value: controller.budgetList.isEmpty ? 0 : (controller.budgetList[0].budget.toDouble() / controller.budgetList[0].plan.toDouble()) * 100 * 0.01,
                                  strokeWidth: 15.0,
                                ),
                              ),
                              Center(
                                child: Text(
                                  controller.budgetList.isEmpty
                                      ? ""
                                      : "${((controller.budgetList[0].budget.toDouble() / controller.budgetList[0].plan.toDouble()) * 100).round()}%",
                                  style: TextStyle(fontSize: 20.0, color: Colors.teal),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * 0.05),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "Budget: ",
                              style: TextStyle(color: Colors.black, fontSize: 16.0),
                              children: [
                                TextSpan(
                                    text: controller.budgetList.isEmpty ? "" : "\n${controller.budgetList[0].budget} birr",
                                    style: TextStyle(fontSize: 24.0, color: Colors.teal, fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          RichText(
                            text: TextSpan(
                              text: "plan: ",
                              style: TextStyle(color: Colors.black, fontSize: 16.0),
                              children: [
                                TextSpan(
                                    text: controller.budgetList.isEmpty ? "" : "\n${controller.budgetList[0].plan} birr",
                                    style: TextStyle(fontSize: 24.0, color: Colors.teal, fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              GetBuilder<BudgetController>(
                builder: (controller) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.budgetList.isEmpty ? "" : "Hi \n${controller.budgetList[0].name.capitalize}",
                      style: TextStyle(fontSize: 42.0, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      controller.budgetList.isEmpty ? "" : "Your Budget is:",
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      controller.budgetList.isEmpty ? "" : "${controller.budgetList[0].budget.toString()} Birr",
                      style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w600, color: Colors.teal),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      controller.budgetList.isEmpty
                          ? ""
                          : "${((((controller.budgetList[0].budget / controller.budgetList[0].plan.toDouble()) * 100) - 100) * -1).round()} % left to achieve your goal.",
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.teal),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.04),
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
              SizedBox(height: size.height * 0.02),
              MaterialButton(
                onPressed: () {
                  _budgetController.resetAccount(0);
                  Get.offAll(() => SplashScreen(), transition: Transition.cupertino);
                },
                height: 50.0,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                color: Color(0xffF54748),
                child: Text("Reset Data", style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
