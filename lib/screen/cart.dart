import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartrdState();
}

class _CartrdState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("cart Page", style: TextStyle(fontSize: 30),),),

    );
  }
}
