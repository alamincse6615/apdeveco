import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {

  ProductDetails();

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProductsDetaails"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.red,
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Text("Details"),
          ),
          Container(
            color: Colors.red,
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("cARd"),
                Text("cHECKLIST"),

              ],
            ),
          ),
        ],
      )
    );
  }
}
