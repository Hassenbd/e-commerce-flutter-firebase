import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField(this.title, this.icon, {super.key});
  final Icon icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: kSecondaryColor),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: icon,
          border: InputBorder.none,
          hintText: title,
        ),
      ),
    );
  }
}
