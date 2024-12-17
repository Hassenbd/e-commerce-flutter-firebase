import 'package:flutter/material.dart';

// ignore: camel_case_types
class icon_widget extends StatelessWidget {
  const icon_widget({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      // ignore: sized_box_for_whitespace
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
    );
  }
}