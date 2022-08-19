import 'dart:convert';
import 'package:appdeveco/model/category%20model.dart';
import 'package:http/http.dart' as http;


class CategoryData{
  List<Data> allCategoryList = [];
  late CategoryModel categoryModel;
  Future<List<Data>>getAlCategory() async {
    String categoreyUrl = "http://192.168.0.106/appdev/api/v2/categories";
    var result = await http.get(Uri.parse(categoreyUrl));
    categoryModel =  CategoryModel.fromJson(jsonDecode(result.body));
    if(categoryModel.status == 200 && categoryModel.data!=null)
      allCategoryList = categoryModel.data!;
    return allCategoryList;
  }
}