import 'dart:convert';
import 'package:appdeveco/model/category_product_model.dart';
import 'package:appdeveco/model/productModel.dart';
import 'package:http/http.dart' as http;

class ProductData{
  List<Data> allProductList = [];
  List<CategoryProductModelData> categoryProductList = [];

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



  Future<List<CategoryProductModelData>>getCategoryProduct(id) async {
    late CategoryProductModel categoryProductModel;
    String productsUrl = "https://e.shibcharnews.com/api/v2/products/"+id.toString();
    var result = await http.get(Uri.parse(productsUrl));
    var JsonData = jsonDecode(result.body);
    if (jsonDecode(result.body)["success"])
      categoryProductModel = CategoryProductModel.fromJson(JsonData);
    if(categoryProductModel.status==200 && categoryProductModel.categoryProductModelDataList!=null)
      categoryProductList = categoryProductModel.categoryProductModelDataList!;
    return categoryProductList;
  }
}

