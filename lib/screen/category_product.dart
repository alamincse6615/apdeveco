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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  children: [
                    buildProductHorizontalView(),
                  ],
                )),
          ],
        ),
      ),
    );
  }
  Widget buildProductHorizontalView() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: categoryProductsList.length==0?CircularProgressIndicator():GridView.builder(
          physics: ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 230,
              mainAxisSpacing: 10,
              mainAxisExtent: 105
          ),
          itemCount: categoryProductsList.length,
          // itemCount: productList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 5,
                right: 5,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetails()));
                  // productList[index]
                },
                child: Container(
                  height: 230,
                  width: 100,
                  color: Colors.red,
                  child: Column(
                    children: [
                      Image.network(
                        "https://e.shibcharnews.com/public/"+categoryProductsList[index].thumbnailImage.toString()??"https://productmanagementfestival.com/wp-content/uploads/2017/01/sell-your-product-online.jpg",
                        height: 70,
                        // "http://192.168.43.113:81/appdev/public/" +
                        //     productList[index].thumbnailImage.toString()
                      ),
                      Text(categoryProductsList[index].name.toString()??""
                        // productList[index].name.toString()
                      ),
                      Text(
                          categoryProductsList[index].strokedPrice.toString()??"",
                        style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough
                        ),
                      ),
                      Text(categoryProductsList[index].mainPrice.toString()??""),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
