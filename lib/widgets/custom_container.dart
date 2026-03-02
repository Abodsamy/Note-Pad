import 'package:flutter/material.dart';
import 'package:loginnotebad/screens/login_screen.dart';
class Containur extends StatelessWidget {
  const Containur({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      },
      child: Container(
        width: 283,
        height: 64,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            shape: BoxShape.rectangle, color: Colors.black),
        child: const Center(
          child: Text("Let’s Start", style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),),
        ),
      ),
    );
  }
}
