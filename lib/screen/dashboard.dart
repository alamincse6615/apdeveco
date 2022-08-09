import 'package:appdeveco/screen/cart.dart';
import 'package:appdeveco/screen/category.dart';
import 'package:appdeveco/screen/home.dart';
import 'package:appdeveco/screen/profile.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var _pages=[
    Home(),
    Category(),
    Cart(),
    Profile(),
  ];
  int selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.green,
        currentIndex: selectedPage,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.category),label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: ""),
        ],
        onTap: (pageIndex){
          selectedPage = pageIndex;
          setState(() {

          });
        },
      ),

    );
  }
}
