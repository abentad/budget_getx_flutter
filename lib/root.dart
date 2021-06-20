import 'package:budget_tracker/home_screen.dart';
import 'package:budget_tracker/intro_screen.dart';
import 'package:flutter/material.dart';

class Root extends StatelessWidget {
  final bool isIntroduced;
  Root({required this.isIntroduced});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isIntroduced ? HomeScreen() : IntroScreen(),
    );
  }
}
