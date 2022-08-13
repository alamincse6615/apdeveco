import 'package:appdeveco/Json/category%20model.dart';
import 'package:appdeveco/screen/category.dart';
import 'package:appdeveco/screen/product_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  List<CategoryModel> categoryList;
  Home(this.categoryList);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categoryList=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryList = widget.categoryList;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // obaidul
          Container(height: 250,color: Colors.green,child: Center(child: Text("Obaidul"),),),
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
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green)
                  ),
                  child: Stack(
                    children: [
                      Image.network(
                          height: 140,
                          width: 140,
                          "http://192.168.43.232/appdev/public/"+categoryList[index].icon.toString(),
                        fit: BoxFit.cover,
                      ),
                      Container(
                        height: 140,
                        width: 140,
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(

                        ),
                        child: Container(
                            height: 30,
                            width: 140,
                            color: Color(0x74050505),
                            alignment: Alignment.center,
                            child: Text(categoryList[index].name.toString(),style: TextStyle(color: Colors.white,fontSize: 18),)),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          buildHeaderSection("Product")
        ],
      ),

    );
  }
  Widget buildHeaderSection(title){
    return Container(
        padding: EdgeInsets.only(left: 5,right: 5),
        height: 30,child:Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18)),
        InkWell(
            onTap: (){
              if(title=="Category"){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder:(context)=>Category(categoryList)
                    )
                );
              }
              else if(title=="Product"){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder:(context)=>ProductPage()
                    )
                );
              }
            },

        child: Text("View All",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18))),
      ],
    ));
  }
}
