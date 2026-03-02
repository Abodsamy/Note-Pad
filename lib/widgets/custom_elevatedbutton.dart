import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton(
      {super.key,
        required this.backgroundColor,
        required this.text,
        required this.width,
        required this.onpressed, required this.height});

  final Color backgroundColor;
  final String text;
  final double width;
  final double height;

  void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height :height,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

