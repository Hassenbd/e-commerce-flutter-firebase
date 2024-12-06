import 'package:e_commerce/widgets/input_field.dart';
import 'package:flutter/material.dart';

class login extends StatelessWidget {
  const login({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const InputField("email"),
          const InputField("password"),
          const SizedBox(
            height: 14,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.black),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "login",
              ),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text("Don't have account ?"),
            TextButton(onPressed: () {}, child: const Text("Sign up"))
          ])
        ],
      ),
    );
  }
}
