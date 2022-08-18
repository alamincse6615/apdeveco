import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartrdState();
}

class _CartrdState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Cart")),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height-100,
            width: MediaQuery.of(context).size.width,

            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.topLeft,
                  child: ListView.builder(
                    itemCount: 20,
                      itemBuilder: (BuildContext context, int index){
                        return Container(
                          height: 155,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            elevation: 5,
                            child: Row(
                              children: [
                                Image.network(
                                    "https://www.transparentpng.com/thumb/apple-logo/mEloYO-apple-logo-free-download.png",
                                  height: 90,
                                  width: 90,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0,left: 5.0),
                                      child: Text(
                                          "Xiaomi Redmi K20 Pro",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 3.0,left:5.0 ),
                                      child: Text(
                                          "Category",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 3.0,left:5.0,bottom: 0.0 ),
                                      child: Text(
                                        "Price",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 15.0),
                                          child: IconButton(
                                              onPressed: (){

                                              },
                                              icon: Icon(Icons.maximize_rounded)
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(top: 0),
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black12),
                                            borderRadius: BorderRadius.all(Radius.circular(5.0))
                                          ),
                                          child: Text(
                                              "0",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: (){

                                            },
                                            icon: Icon(Icons.add)
                                        ),
                                        Text(
                                            "Sub-Total: 1000",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }
                  ),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black.withOpacity(0.8),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        height: MediaQuery.of(context).size.height,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                  "Total Item: 5",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            Text(
                                "Total : 500",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500
                              ),
                            )
                          ],
                        ),
                      ),
                      TextButton(
                          onPressed: (){

                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width-215,
                            height: MediaQuery.of(context).size.height,
                            alignment: Alignment.center,
                            color: Colors.red,
                            child: Text(
                                "Check Out",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          )
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ]
    )
    );
  }
}
