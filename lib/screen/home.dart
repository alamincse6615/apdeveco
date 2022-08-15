import 'package:appdeveco/Json/category%20model.dart';
import 'package:appdeveco/Json/productModel.dart';
import 'package:appdeveco/screen/category.dart';
import 'package:appdeveco/screen/product_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  List<CategoryModel> categoryList;
  // List<ProductModel> productsList;
  // List<DataModel> dataList;

  Home(this.categoryList);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categoryList = [];
  // List<ProductModel> productsList = [];
  // List<DataModel> dataList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryList = widget.categoryList;
    // productsList = widget.productsList;
    // dataList = widget.dataList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
         CarouselSlider(
            items:[
              Card(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue
                  ),
                  width: 250,
                  child: Center(child: Text("Saturday",style: TextStyle(fontSize: 50),)),
                ),
              ),
              Card(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green
                  ),
                  width: 250,
                  child: Center(child: Text("Sunday",style: TextStyle(fontSize: 50),)),
                ),
              ),
              Card(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red
                  ),
                  width: 250,
                  child: Center(child: Text("Monday",style: TextStyle(fontSize: 50),)),
                ),
              ),
              Card(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber
                  ),
                  width: 250,
                  child: Center(child: Text("Tuesday",style: TextStyle(fontSize: 50),)),
                ),
              ),
              Card(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueAccent
                  ),
                  width: 250,
                  child: Center(child: Text("Wednesday",style: TextStyle(fontSize: 40),)),
                ),
              ),
              Card(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.yellowAccent
                  ),
                  width: 250,
                  child: Center(child: Text("Thursday",style: TextStyle(fontSize: 50),)),
                ),
              ),
              Card(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.indigo
                  ),
                  width: 250,
                  child: Center(child: Text("Fryday",style: TextStyle(fontSize: 50),),),
                ),
              ),

            ],
            options: CarouselOptions(
                autoPlay: true,
                autoPlayCurve: Curves.easeInBack
            ),

          ),

          buildHeaderSection("Category"),
          Container(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                  height: 140,
                  width: 140,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.green)),
                  child: Stack(
                    children: [
                      Image.network(
                        height: 140,
                        width: 140,
                        "http://192.168.43.232/appdev/public/" +
                            categoryList[index].icon.toString(),
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
                              categoryList[index].name.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          buildHeaderSection("Product"),
          Container(
            height: 500,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisSpacing: 10,

                    mainAxisExtent: 105),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5,),
                    child: Container(
                      height: 200,
                      width: 100,
                      color: Colors.yellow,
                      child: Column(
                        children: [
                          Image.network(
                              height: 70,
                         "https://media.istockphoto.com/illustrations/top-10-illustration-id1198212752?k=20&m=1198212752&s=612x612&w=0&h=X_khGMO-kioeJCt72czCPcq_1abX2-tLfY5eIXSr_l4="),
                          Text("name"),
                          Text("price"),

                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProductPage()));
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
}
