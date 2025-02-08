import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screen/admin/addProduct.dart';
import 'package:e_commerce/screen/admin/listsProduct.dart';
import 'package:flutter/material.dart';

class Admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kMainColor,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => Addproduct()));
                },
                child: const Text("Add Product")),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const ListsProduct()));
              },
              child: const Text("Edit Product"),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Show order"),
            )
          ]),
        ));
  }
}
