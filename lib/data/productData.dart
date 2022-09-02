import 'dart:convert';
import 'package:appdeveco/model/productModel.dart';
import 'package:http/http.dart' as http;

class ProductData{
  List<Data> allProductList = [];

  Future<List<Data>>getAlProduct() async {
    late ProductModel productModel;
    String productsUrl = "https://e.shibcharnews.com/api/v2/products";
    var result = await http.get(Uri.parse(productsUrl));
    var JsonData = jsonDecode(result.body);
    if (jsonDecode(result.body)["success"])
      productModel = ProductModel.fromJson(JsonData);
    if(productModel.status==200 && productModel.data!=null)
    allProductList = productModel.data!;
    return allProductList;
  }



 /* Future<List<Data>>getCategoryAlProduct(id) async {
    late ProductModel productModel;
    String productsUrl = "https://e.shibcharnews.com/api/v2/products/"+id;
    var result = await http.get(Uri.parse(productsUrl));
    var JsonData = jsonDecode(result.body);
    if (jsonDecode(result.body)["success"])
      productModel = ProductModel.fromJson(JsonData);
    if(productModel.status==200 && productModel.data!=null)
      allProductList = productModel.data!;
    return allProductList;
  }*/
}

