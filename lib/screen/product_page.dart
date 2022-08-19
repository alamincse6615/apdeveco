import 'dart:convert';

import 'package:appdeveco/model/category%20model.dart';
import 'package:appdeveco/model/productModel.dart';
import 'package:flutter/material.dart';


class ProductPage extends StatefulWidget {

  List<PData> productList;
  ProductPage(this.productList);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<PData> dataList = [];

  @override
  void initState() {
    dataList = widget.productList;
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
          itemCount: dataList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
              height: 80,
              width: MediaQuery.of(context).size.width-10,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.2),
              ),
              child: ListTile(
                title: Text(dataList[index].name.toString()),
                subtitle: Row(
                  children: [
                    Text(dataList[index].basePrice.toString()),
                    Text("prce"),
                  ],
                ),
                leading: Image.network("http://192.168.43.113:81/appdev/public/" +
                    dataList[index].thumbnailImage.toString(),),
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