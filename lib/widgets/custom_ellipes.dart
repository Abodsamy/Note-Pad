import 'package:flutter/material.dart';
class Ellipse extends StatelessWidget {
  const Ellipse({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 17,
          height: 17,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Colors.black),
        ),
        const SizedBox(
          width: 4,
        ),
        Container(
          width: 17,
          height: 17,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              shape: BoxShape.circle,
              color: Colors.white),
        ),
        const SizedBox(
          width: 4,
        ),
        Container(
          width: 17,
          height: 17,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Colors.black),
        ),
      ],
    );
  }
}
