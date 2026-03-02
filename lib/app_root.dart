import 'package:flutter/material.dart';
import 'package:loginnotebad/screens/notes_home_screen.dart';
import 'package:loginnotebad/screens/onboarding_screen.dart';

class NotePad extends StatelessWidget {
  final bool startLoggedIn;

  const NotePad({super.key, required this.startLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: startLoggedIn ? const NotesHome() : const OnbordingScreen(),
    );
  }
}