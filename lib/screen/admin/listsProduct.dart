// ignore: file_names
// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/screen/admin/editProduct.dart';
import 'package:e_commerce/services/store.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ListsProduct extends StatefulWidget {
  const ListsProduct({super.key});

  @override
  State<ListsProduct> createState() => _ListsProductState();
}

class _ListsProductState extends State<ListsProduct> {
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
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
                      onTapUp: (details) {
                        double dx = details.globalPosition.dx;
                        double dy = details.globalPosition.dy;
                        double dx2 = MediaQuery.of(context).size.width - dx;
                        double dy2 = MediaQuery.of(context).size.height - dy;
                        showMenu(
                            context: context,
                            position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
                            items: [
                              MyPopupMenuItem(
                                () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) =>
                                          EditProduct(products[item].pId)));
                                },
                                child: const Text("Edit"),
                              ),
                              MyPopupMenuItem(() {
                                _store.deleteProduct(products[item].pId);
                              }, child: const Text("Delete")),
                            ]);
                      },
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
            }));
  }
}

class MyPopupMenuItem<T> extends PopupMenuItem<T> {
  final Widget child;
  final Function onClick;
  const MyPopupMenuItem(this.onClick, {super.key, required this.child})
      : super(child: child);

  @override
  PopupMenuItemState<T, PopupMenuItem<T>> createState() {
    return MyPopupMenuItemState();
  }
}

class MyPopupMenuItemState<T, PopMenuItem>
    extends PopupMenuItemState<T, MyPopupMenuItem<T>> {
  @override
  void handleTap() {
    widget.onClick();
  }
}
