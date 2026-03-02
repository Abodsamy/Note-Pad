import 'package:flutter/material.dart';
import 'package:loginnotebad/app_root.dart';
import 'package:loginnotebad/shared_preference_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final loggedIn = await SharedPrefHelper.isLoggedIn();
  runApp(NotePad(startLoggedIn: loggedIn));
}