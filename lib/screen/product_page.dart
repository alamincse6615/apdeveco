import 'dart:convert';

import 'package:appdeveco/Json/category%20model.dart';
import 'package:flutter/material.dart';


class ProductPage extends StatefulWidget {



  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Product"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - 100,
        child: Center(child: Text("all product"),),
      ),
    );
  }
}
