import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:appdeveco/Json/category%20model.dart';

class CategoryData{
  List<CategoryModel> allCategoryList = [];

  Future<List<CategoryModel>>getAlCategory() async {
    String categoreyUrl = "http://192.168.93.16:81/appdev/api/v1/categories";
    // String categoreyUrl = "http://203.190.14.142/e-commerce/api/v1/categories";
    var result = await http.get(Uri.parse(categoreyUrl));
    var JsonData = jsonDecode(result.body);
    if (jsonDecode(result.body)["success"])
      JsonData['data'].forEach((index) {
        CategoryModel categoryModel = CategoryModel(
          index['banner'] ?? "",
          index['name'] ?? "",
          index['sub_categories'] ?? "",
          index['icon'] ?? "",
          index['number_of_children'] ?? "",
        );
        allCategoryList.add(categoryModel);
      });
    return allCategoryList;
  }
}