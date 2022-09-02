import 'package:appdeveco/screen/home.dart';
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
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text("Details",
            style: TextStyle(
                color: Colors.red,
              backgroundColor: Colors.cyan,

            ),
            ),
          ),
        ));
  }
}
