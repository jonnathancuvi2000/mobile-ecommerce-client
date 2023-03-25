import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ItemsWidget extends StatefulWidget {
  const ItemsWidget({super.key});

  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  var products_list = [
    {
      "name": "Zartera",
      "image": "images/1.png",
      "description": "This is a nice  purch and is veri nice ",
      "price": 90
    },
    {
      "name": "Watch",
      "image": "images/2.png",
      "description": "This is a nice wathc and is very exspenceive",
      "price": 90
    },
    {
      "name": "Purch",
      "image": "images/3.png",
      "description": "This is a nice  purch, adn it cost a lot",
      "price": 90
    },
    {
      "name": "Purch",
      "image": "images/4.png",
      "description": "This is als a nice  Purch but is not so exopencive",
      "price": 90
    },
    {
      "name": "Mango",
      "image": "images/5.png",
      "description": "This is a nice  purch, and I do not know what to write",
      "price": 90
    },
    {
      "name": "Zapatera",
      "image": "images/6.png",
      "description": "This is a nice  Zapatera and I really like it",
      "price": 90
    },
    {
      "name": "Relog",
      "image": "images/7.png",
      "description": "This is an exspnceive reloj",
      "price": 90
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.60,
      ),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: products_list.length,
      itemBuilder: (BuildContext ctx, index) {
        return Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          // margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10), // this was before
          margin: const EdgeInsets.fromLTRB(10,0,10,16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(
              //       padding: EdgeInsets.all(5),
              //       decoration: BoxDecoration(
              //         color: Color.fromARGB(255, 235, 122, 56), //0xFF4C53A2
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //       child: Text(
              //         '-50%',
              //         style: TextStyle(
              //           fontSize: 14,
              //           fontWeight: FontWeight.bold,
              //           color: Colors.white,
              //         ),
              //       ),
              //     ),
              //     Icon(
              //       Icons.favorite_border,
              //       color: Colors.red,
              //     ),
              //   ],
              // ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'itemPage');
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Image.asset(
                    "${products_list[index]['image']}",
                    height: 90,
                    width: 90,
                  ),
                ),
              ),
              Container(
                height: 30,
                padding: EdgeInsets.only(bottom: 8),
                alignment: Alignment.centerLeft,
                child: SingleChildScrollView(
                  child: Text(
                    "${products_list[index]['name']}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 235, 122, 56), //0xFF4C53A2
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 50,
                child: SingleChildScrollView(
                  child: Text(
                    "${products_list[index]['description']}",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 235, 122, 56), //0xFF4C53A2
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${products_list[index]['price']}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(255, 235, 122, 56), //0xFF4C53A2
                      ),
                    ),
                    Icon(
                      Icons.shopping_cart_checkout,
                      color: Color.fromARGB(255, 235, 122, 56), //0xFF4C53A2
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
