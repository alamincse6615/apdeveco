import 'dart:convert';
import 'package:appdeveco/model/productModel.dart';
import 'package:http/http.dart' as http;


class ProductData{
  List<PData> allPategoryList = [];
  late ProductsModel productsModel;
  Future<List<PData>>getAlProduct() async {
    String productUrl = "http://192.168.43.113:81/appdev/api/v1/products";
    var result = await http.get(Uri.parse(productUrl));
    productsModel =  ProductsModel.fromJson(jsonDecode(result.body));
    if(productsModel.status == 200 && productsModel.data!=null)
      allPategoryList = productsModel.data!;
    return allPategoryList;
  }
}