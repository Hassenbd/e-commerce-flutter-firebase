import 'package:e_commerce/constants.dart';
import 'package:e_commerce/widgets/input_field.dart';
import 'package:flutter/material.dart';

class login extends StatelessWidget {
  const login({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: kMainColor
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                height: height * .2,
                child: const Stack(alignment: Alignment.center, children: [
                  Image(image: AssetImage('images/icons/logo.png')),
                  Positioned(
                    bottom: 0,
                    child: Text(
                      "Buy it",
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                  )
                ]),
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            const InputField("email", Icon(Icons.email)),
            SizedBox(
              height: height * .01,
            ),
            const InputField("password", Icon(Icons.lock)),
            SizedBox(
              height: height * .03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 56),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    "Login",
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Don't have account ?"),
              TextButton(onPressed: () {}, child: const Text("Sign up"))
            ])
          ],
        ));
  }
}
