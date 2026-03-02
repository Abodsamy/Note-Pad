import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
        required this.labelTex,
        this.obscureText = false,
        required this.fillColor,
        this.controller, required this.prefixIcon});
   final Icon prefixIcon;
  final String labelTex;
  final bool obscureText;
  final Color fillColor;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            labelText: labelTex,
            filled: true,
            fillColor: fillColor,
            prefixIcon: prefixIcon,
          ),
          obscureText: obscureText,
        ),

      ],
    );
  }
}
