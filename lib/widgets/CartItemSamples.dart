import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CartItemSamples extends StatefulWidget {
  const CartItemSamples({super.key});

  @override
  State<CartItemSamples> createState() => _CartItemSamplesState();
}

class _CartItemSamplesState extends State<CartItemSamples> {
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
        crossAxisCount: 1,
        childAspectRatio: 2.5,
      ),
      itemCount: products_list.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext ctx, index) {
        return Column(
          children: [
            Container(
              height: 110,
              margin: EdgeInsets.symmetric(
                  horizontal: 15), // before it was this -> , vertical: 10
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    child: Radio(
                      value: "",
                      groupValue: '',
                      activeColor: Color.fromARGB(255, 235, 122, 56),
                      onChanged: (index) {},
                    ),
                  ),
                  Container(
                    height: 55,
                    width: 55,
                    margin: EdgeInsets.only(right: 15),
                    child: Image.asset("${products_list[index]['image']}"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // color: Colors.blue,
                          width: 80,
                          height: 20,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              "${products_list[index]['name']}",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 235, 122, 56),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "\$55",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 235, 122, 56),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 10,
                                        spreadRadius: 1)
                                  ]),
                              child: Icon(
                                CupertinoIcons.minus,
                                size: 18,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 6),
                              child: Text(
                                '01',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 235, 122, 56),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 10,
                                        spreadRadius: 1)
                                  ]),
                              child: Icon(
                                CupertinoIcons.plus,
                                size: 18,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
