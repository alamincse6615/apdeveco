import 'package:appdeveco/data/categoryData.dart';
import 'package:appdeveco/data/productData.dart';
import 'package:appdeveco/model/category%20model.dart';
import 'package:appdeveco/model/productModel.dart';
import 'package:appdeveco/screen/category.dart';
import 'package:appdeveco/screen/category_product.dart';
import 'package:appdeveco/screen/product_Details.dart';
import 'package:appdeveco/screen/product_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var categoryList = [];

  var productsList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllData();
  }

  getAllData() async {
    CategoryData categoryData = CategoryData();
    ProductData productData = ProductData();
    categoryList = await categoryData.getAlCategory();
    productsList = await productData.getAlProduct();

    setState(() {});
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
                    CarouselSlider(
                      items: [
                        Card(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue),
                            width: 250,
                            child: Center(
                                child: Text(
                                  "Saturday",
                                  style: TextStyle(fontSize: 50),
                                )),
                          ),
                        ),
                        Card(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green),
                            width: 250,
                            child: Center(
                                child: Text(
                                  "Sunday",
                                  style: TextStyle(fontSize: 50),
                                )),
                          ),
                        ),
                        Card(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red),
                            width: 250,
                            child: Center(
                                child: Text(
                                  "Monday",
                                  style: TextStyle(fontSize: 50),
                                )),
                          ),
                        ),
                        Card(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.amber),
                            width: 250,
                            child: Center(
                                child: Text(
                                  "Tuesday",
                                  style: TextStyle(fontSize: 50),
                                )),
                          ),
                        ),
                        Card(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blueAccent),
                            width: 250,
                            child: Center(
                                child: Text(
                                  "Wednesday",
                                  style: TextStyle(fontSize: 40),
                                )),
                          ),
                        ),
                        Card(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.yellowAccent),
                            width: 250,
                            child: Center(
                                child: Text(
                                  "Thursday",
                                  style: TextStyle(fontSize: 50),
                                )),
                          ),
                        ),
                        Card(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.indigo),
                            width: 250,
                            child: Center(
                              child: Text(
                                "Fryday",
                                style: TextStyle(fontSize: 50),
                              ),
                            ),
                          ),
                        ),
                      ],
                      options: CarouselOptions(
                          autoPlay: true, autoPlayCurve: Curves.easeInBack),
                    ),
                    buildHeaderSection("Category"),
                    Container(
                      height: 150,
                      child: InkWell(
                        onTap: () {},
                        child: categoryList.length == 0
                            ? CircularProgressIndicator()
                            : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                if (categoryList[index].id==null) {
                                  showDialog(
                                      context: context, builder: (context)=>
                                      AlertDialog(
                                        title: Text("Products Namne"),
                                        content: Text("Stok Out"),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                                            },
                                            child: Text("Okay"),
                                          ),

                                        ],
                                      )
                                  );
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CategoryProduct(int.parse(
                                                  categoryList[index]
                                                      .id
                                                      .toString()))));
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                                height: 140,
                                width: 140,
                                decoration: BoxDecoration(
                                    border:
                                    Border.all(color: Colors.green)),
                                child: Stack(
                                  children: [
                                    Image.network(
                                      height: 140,
                                      width: 140,
                                      "https://e.shibcharnews.com/public/" +
                                          categoryList[index]
                                              .icon
                                              .toString(),
                                      fit: BoxFit.cover,
                                    ),
                                    Container(
                                      height: 140,
                                      width: 140,
                                      alignment: Alignment.bottomCenter,
                                      decoration: BoxDecoration(),
                                      child: Container(
                                          height: 30,
                                          width: 140,
                                          color: Color(0x74050505),
                                          alignment: Alignment.center,
                                          child: Text(
                                            categoryList[index]
                                                .name
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    buildHeaderSection("Product"),
                    buildProductHorizontalView(),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget buildHeaderSection(title) {
    return Container(
        padding: EdgeInsets.only(left: 5, right: 5),
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            InkWell(
                onTap: () {
                  if (title == "Category") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Category(categoryList)));
                  } else if (title == "Product") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductPage(productsList)));

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductPage(productsList)));
                  }
                },
                child: Text("View All",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18))),
          ],
        ));
  }

  Widget buildProductHorizontalView() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: productsList.length == 0
          ? CircularProgressIndicator()
          : GridView.builder(
          physics: ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 10,
              mainAxisExtent: 105),
          itemCount: productsList.length,
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
                  height: 200,
                  width: 100,
                  color: Colors.white30,
                  child: Column(
                    children: [
                      Image.network(
                        "https://e.shibcharnews.com/public/" +
                            productsList[index]
                                .thumbnailImage
                                .toString() ??
                            "https://productmanagementfestival.com/wp-content/uploads/2017/01/sell-your-product-online.jpg",
                        height: 70,
                      ),
                      Text(productsList[index].name.toString() ?? ""),
                      Text(productsList[index].basePrice.toString() ?? ""),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}