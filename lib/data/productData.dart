import 'dart:convert';
import 'package:appdeveco/model/productModel.dart';
import 'package:http/http.dart' as http;

class ProductData{
  List<Datal> allProductList = [];

  Future<List<Datal>>getAlProduct() async {
    String productsUrl = "http://192.168.0.106/appdev/api/v2/products";
    var result = await http.get(Uri.parse(productsUrl));
    var JsonData = jsonDecode(result.body);
    if (jsonDecode(result.body)["success"])
      JsonData['data'].forEach((index) {
        Datal productModel = Datal(
          // index['data'] ?? "",
        );
        allProductList.add(productModel);
      });
    return allProductList;
  }
}

// class dataProductData {
//   List<Datal> allProductdataList = [];
//   Future<List<Datal>>getAlProductdata() async {
//     String productsUrl = "http://192.168.93.16:81/appdev/api/v1/products";
//     var result = await http.get(Uri.parse(productsUrl));
//     var JsonData = jsonDecode(result.body);
//     if (jsonDecode(result.body)["success"])
//       JsonData['data'].forEach((index) {
//         Datal dataModel = Datal(
//           index['name'] ?? "",
//           index['thumbnailImage'] ?? "",
//           index['basePrice'] ?? "",
//         );
//         allProductdataList.add(dataModel);
//       });
//     return allProductdataList;
//   }
//
// }