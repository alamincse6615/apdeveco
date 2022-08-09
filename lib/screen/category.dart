import 'dart:convert';

import 'package:appdeveco/Json/category%20model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  List<CategoryModel> dataList = [];

  @override
  void initState() {
    getDataFormCategoryJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "category Page",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  getDataFormCategoryJson() async {
    String categoreyUrl = "http://192.168.93.16:81/appdev/api/v1/categories";
    var result = await http.get(Uri.parse(categoreyUrl));
    print(result);

    var JsonData = jsonDecode(result.body);

    JsonData['categoryModel'].forEach ((index){
  CategoryModel categoryModel = CategoryModel(
      index['banner']?? "",
      index['name']?? "",
      index['sub_categories']?? "",
  );

  dataList.add(categoryModel);

  print(dataList);
});
    setState((){

    });
  }
}
