import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/services/store.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditProduct extends StatefulWidget {
  const EditProduct({super.key});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: _store.loadProducts(),
            builder: (context, snapshot) {
              print("hello");
              print(snapshot);
              List<Product> products = [];
              if (snapshot.hasData) {
                for (var doc in snapshot.data!.docs) {
                  var data = doc.data() as Map<String, dynamic>;
                  // print(data);
                  products.add(Product(
                      data[kProductName],
                      data[kProductCategory],
                      data[kProductPrice],
                      data[kProductLocation],
                      data[kProductDescription]));
                }

                // print(products);

                return ListView.builder(
                  itemBuilder: (context, item) => Text(products[item].name),
                  itemCount: products.length,
                );
              } else {
                print("no data");
                return ModalProgressHUD(
                  inAsyncCall: !snapshot.hasData,
                  child: Container(),
                );
              }
            }));
  }
}
