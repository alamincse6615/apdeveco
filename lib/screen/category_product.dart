import 'package:appdeveco/data/categoryData.dart';
import 'package:appdeveco/data/productData.dart';
import 'package:appdeveco/model/category%20model.dart';
import 'package:appdeveco/model/productModel.dart';
import 'package:appdeveco/screen/category.dart';
import 'package:appdeveco/screen/product_Details.dart';
import 'package:appdeveco/screen/product_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CategoryProduct extends StatefulWidget {
  int id;


  CategoryProduct(this.id);

  @override
  State<CategoryProduct> createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {


  var categoryProductsList = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllData();
  }

  getAllData()async{
    ProductData productData = ProductData();

    categoryProductsList = await productData.getCategoryProduct(widget.id);

    print(categoryProductsList);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: categoryProductsList.length==0?Center(child: Container(child: CircularProgressIndicator(strokeWidth: 2.0),width: 50,height: 50,)):GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height -350),
            ),

            itemCount: categoryProductsList.length,
            // itemCount: productList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetails()));
                },
                child: Container(
                  height: 400,
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        children: [
                          Image.network(
                            "https://e.shibcharnews.com/public/"+categoryProductsList[index].thumbnailImage.toString()??"https://productmanagementfestival.com/wp-content/uploads/2017/01/sell-your-product-online.jpg",
                            height: 130,
                            width: 130,
                            fit: BoxFit.fill,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(categoryProductsList[index].name.toString()??"",
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          // Text(
                          //     categoryProductsList[index].strokedPrice.toString()??"",
                          //   style: TextStyle(
                          //       color: Colors.grey,
                          //       decoration: TextDecoration.lineThrough
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(categoryProductsList[index].basePrice.toString()??"",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      )
    );
  }
  // Widget buildProductHorizontalView() {
  //   return Container(
  //     height: 1200,
  //     width: MediaQuery.of(context).size.width,
  //     child:
  //   );
  // }
}
