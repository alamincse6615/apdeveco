import 'package:appdeveco/screen/home.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails();

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData.fallback(),
          backgroundColor: Colors.white,
          title: Text(
            "My Cart",
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          titleSpacing: 20,
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Delete",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 17,
                        color: Colors.black),
                  )),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 175,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                    height: 80,
                    width: MediaQuery.of(context).size.width - 10,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.2),
                    ),
                    child: ListTile(
                      title: Text("Name"),
                      subtitle: Row(
                        children: [
                          Text("Price "),
                          //Text(dataList[index].number_of_children.toString()),
                        ],
                      ),
                      leading: Image.network(
                          "https://productmanagementfestival.com/wp-content/uploads/2017/01/sell-your-product-online.jpg"),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: () {}, child: Text("All")),
                    TextButton(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails()));
                        },
                        child: Text("Check Out")),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
