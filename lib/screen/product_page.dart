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
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
              height: 80,
              width: MediaQuery.of(context).size.width-10,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.2),
              ),
              child: ListTile(
                title: Text("Name"),
                subtitle: Row(
                  children: [
                    Text("Sub Category "),
                    Text("prce"),
                  ],
                ),
                leading: Image.network( "https://media.istockphoto.com/illustrations/top-10-illustration-id1198212752?k=20&m=1198212752&s=612x612&w=0&h=X_khGMO-kioeJCt72czCPcq_1abX2-tLfY5eIXSr_l4=",),
                // trailing: Image.network("https://media.istockphoto.com/illustrations/top-10-illustration-id1198212752?k=20&m=1198212752&s=612x612&w=0&h=X_khGMO-kioeJCt72czCPcq_1abX2-tLfY5eIXSr_l4="),
              ),
            );
          },
        ),
      ),
    );
  }
}
//http://192.168.93.16:81/appdev/api/v1/products