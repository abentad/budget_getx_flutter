import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

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
                onPressed: () {},
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
