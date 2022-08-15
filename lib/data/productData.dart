import 'dart:convert';
import 'package:appdeveco/Json/productModel.dart';
import 'package:http/http.dart' as http;

class ProductData{
  List<ProductModel> allProductList = [];

  Future<List<ProductModel>>getAlProduct() async {
    String productsUrl = "http://192.168.93.16:81/appdev/api/v1/products";
    var result = await http.get(Uri.parse(productsUrl));
    var JsonData = jsonDecode(result.body);
    if (jsonDecode(result.body)["success"])
      JsonData['data'].forEach((index) {
        ProductModel productModel = ProductModel(
          index['data'] ?? "",
        );
        allProductList.add(productModel);
      });
    return allProductList;
  }
}

class dataProductData {
  List<DataModel> allProductdataList = [];
  Future<List<DataModel>>getAlProductdata() async {
    String productsUrl = "http://192.168.93.16:81/appdev/api/v1/products";
    var result = await http.get(Uri.parse(productsUrl));
    var JsonData = jsonDecode(result.body);
    if (jsonDecode(result.body)["success"])
      JsonData['data'].forEach((index) {
        DataModel dataModel = DataModel(
          index['name'] ?? "",
          index['thumbnailImage'] ?? "",
          index['basePrice'] ?? "",
        );
        allProductdataList.add(dataModel);
      });
    return allProductdataList;
  }

}