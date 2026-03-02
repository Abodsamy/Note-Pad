import 'package:flutter/material.dart';
import 'package:loginnotebad/screens/login_screen.dart';
import 'package:loginnotebad/widgets/custom_ellipes.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                const Ellipse(),
                Image.asset(
                  "assets/image/spot of balls and lines.png",
                  width: 211,
                  height: 236,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Refine Your Life Management",
                  style: TextStyle(fontSize: 45, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "A minimalist Notes app which helps you manage your time and be productive, the monochrome design avoids it from being distracting",
                  style: TextStyle(fontSize: 13, color: Color(0xff4F5C6E)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LoginScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 56,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Let s Start',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}