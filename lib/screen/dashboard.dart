
import 'package:appdeveco/model/category%20model.dart';
import 'package:appdeveco/data/categoryData.dart';
import 'package:appdeveco/model/productModel.dart';
import 'package:appdeveco/screen/cart.dart';
import 'package:appdeveco/screen/category.dart';
import 'package:appdeveco/screen/home.dart';
import 'package:appdeveco/screen/login_page.dart';
import 'package:appdeveco/screen/profile.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Data> categoryList = [];
  List<PData> productList = [];
  int selectedPage = 0;

  @override
  void initState() {
    getAllData();
  }

  getAllData()async{
    CategoryData categoryData = CategoryData();
    categoryList = await categoryData.getAlCategory();
    print(categoryList);
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: selectedPage==0?Home(categoryList,productList):(selectedPage==1?Category(categoryList):(selectedPage==2?Cart():LoginPage())),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.green,
        currentIndex: selectedPage,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.category),label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
        ],
        onTap: (pageIndex){
          setState(() {
            selectedPage = pageIndex;
          });
        },
      ),
    );
  }
}
