import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/services/store.dart';
import 'package:e_commerce/widgets/input_field.dart';
import 'package:flutter/material.dart';

class Addproduct extends StatelessWidget {
  late String _name, _price, _description, _category, _imageLocation;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kMainColor,
        body: Form(
          key: _formKey,
          child: Column(children: [
            InputField((value) {
              _name = value;
            }, 'Product Name', const Icon(Icons.add_shopping_cart_rounded)),
            InputField((value) {
              _price = value;
            }, 'Product Price', const Icon(Icons.price_change)),
            InputField((value) {
              _description = value;
            }, 'Product Description', const Icon(Icons.description)),
            InputField((value) {
              _category = value;
            }, 'Product Category', const Icon(Icons.category)),
            InputField((value) {
              _imageLocation = value;
            }, 'Product Location', const Icon(Icons.location_on)),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        final product = Product(_name, _category, _price,
                            _imageLocation, _description);
                        final store = Store();
                        store.addProduct(product);
                      }
                    },
                    child: const Text("Add Product")),
                TextButton(
                    onPressed: () {
                      _formKey.currentState!.reset();
                    },
                    child: const Text("Reset"))
              ],
            )
          ]),
        ));
  }
}
