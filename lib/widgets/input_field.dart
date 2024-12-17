import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField(this.onClick, this.title, this.icon, {super.key});
  final Icon icon;
  final String title;
  final Function onClick;

  String setError(String value) {
    switch (value) {
      case 'username':
        return "name is emtpy";
      case 'password':
        return "password is empty";
      case 'email':
        return "email is empty";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: kSecondaryColor),
      child: TextFormField(
        // ignore: body_might_complete_normally_nullable
        validator: (value) {
          if (value!.isEmpty) {
            return setError(title);
          }
        },
        onSaved: (value) {
          onClick(value);
        },
        obscureText: title == "password" ? true : false,
        decoration: InputDecoration(
          prefixIcon: icon,
          border: InputBorder.none,
          hintText: title,
        ),
      ),
    );
  }
}
