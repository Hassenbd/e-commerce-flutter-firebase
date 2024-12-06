import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField(this.title, {super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white70),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: title,
        ),
      ),
    );
  }
}
