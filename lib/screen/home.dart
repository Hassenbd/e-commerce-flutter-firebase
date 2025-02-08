import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/screen/admin/editProduct.dart';
import 'package:e_commerce/screen/admin/listsProduct.dart';
import 'package:e_commerce/services/store.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;
  var _store = Store();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultTabController(
          length: 4,
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                bottom: TabBar(
                  onTap: (value) {
                    setState(() {
                      _index = value;
                    });
                  },
                  tabs: [
                    Text("Jackets",
                        style: TextStyle(
                            color: _index == 0 ? Colors.black : kUnActiveColor,
                            fontSize: _index == 0 ? 16 : null)),
                    Text("Trouser",
                        style: TextStyle(
                            color: _index == 1 ? Colors.black : kUnActiveColor,
                            fontSize: _index == 1 ? 16 : null)),
                    Text("T-shirts",
                        style: TextStyle(
                            color: _index == 2 ? Colors.black : kUnActiveColor,
                            fontSize: _index == 2 ? 16 : null)),
                    Text("Shoes",
                        style: TextStyle(
                            color: _index == 3 ? Colors.black : kUnActiveColor,
                            fontSize: _index == 3 ? 16 : null))
                  ],
                ),
              ),
              body: TabBarView(
                  children: [jacketView(), Text("TEst"), Text("Test")])),
        ),
        Material(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(21, 6, 21, 0),
            child: Container(
              height: MediaQuery.of(context).size.height * .1,
              child: const Row(
                children: [
                  Text(
                    'Discover',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.shopping_cart)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget jacketView() {
    return StreamBuilder<QuerySnapshot>(
        stream: _store.loadProducts(),
        builder: (context, snapshot) {
          List<Product> products = [];
          if (snapshot.hasData) {
            for (var doc in snapshot.data!.docs) {
              var data = doc.data() as Map<String, dynamic>;

              var p = Product(
                  data[kProductName],
                  data[kProductCategory],
                  data[kProductPrice],
                  data[kProductLocation],
                  data[kProductDescription]);
              p.setId(doc.id);
              products.add(p);
            }

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, item) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Stack(
                    children: [
                      Positioned.fill(
                          child: Image(
                              image: AssetImage(products[item].location),
                              fit: BoxFit.fill)),
                      Positioned(
                        bottom: 0,
                        child: Opacity(
                          opacity: .6,
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(products[item].name),
                                Text('\$ ${products[item].price}')
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              itemCount: products.length,
            );
          } else {
            return ModalProgressHUD(
              inAsyncCall: !snapshot.hasData,
              child: Container(),
            );
          }
        });
  }
}
