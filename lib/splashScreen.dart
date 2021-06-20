import 'package:budget_tracker/controller/budget_controller.dart';
import 'package:budget_tracker/root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  BudgetController _budgetController = Get.find<BudgetController>();
  late bool isIntroduced = false;

  @override
  void initState() {
    check();
    print(isIntroduced);
    super.initState();
  }

  void check() async {
    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isIntroduced = _budgetController.isUserIntroduced;
      });
    });
    print("in splashScreen loaded from db: introduced: $isIntroduced");
    print("goint to root passing: $isIntroduced as param");
    Get.offAll(() => Root(isIntroduced: isIntroduced), transition: Transition.fadeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: CircularProgressIndicator(color: Colors.teal),
        ),
      ),
    );
  }
}
