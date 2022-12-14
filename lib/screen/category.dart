import 'dart:convert';

import 'package:appdeveco/model/category%20model.dart';
import 'package:flutter/material.dart';


class Category extends StatefulWidget {
  var categoryList;
  Category(this.categoryList);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  var dataList ;

  @override
  void initState() {
    dataList = widget.categoryList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Catagory"),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height - 100,
          child: InkWell(
            onTap: (){

            },
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
                        Text(dataList[index].id.toString()),
                      ],
                    ),
                    leading: Image.network(
                        "https://e.shibcharnews.com/public/"+dataList[index].icon.toString()),
                    trailing: Image.network(
                        "https://e.shibcharnews.com/public/"+dataList[index].icon.toString()),
                  ),
                );
              },
            ),
          ),
        )

    );
  }
}