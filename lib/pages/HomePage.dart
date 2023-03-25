import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce_ui/widgets/Carrusel.dart';
import 'package:ecommerce_ui/widgets/CategoriesWidget.dart';
import 'package:ecommerce_ui/widgets/HomeAppBar.dart';
import 'package:ecommerce_ui/widgets/ItemsWidgets.dart';
import 'package:ecommerce_ui/widgets/SideNavbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      drawer: SideNavBar(),
      body: ListView(
        children: [
          HomeAppBar(data: _scaffoldState), // nav bar
          // buscador
          Container(
            // height: 500,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                // CARRUCEL
                Carrusel(),
                // //BUscar
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 15),
                //   margin: EdgeInsets.symmetric(horizontal: 15),
                //   decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(30)),
                //   child: Row(
                //     children: [
                //       Container(
                //         height: 50,
                //         width: MediaQuery.of(context).size.width / 1.4,
                //         margin: EdgeInsets.only(left: 5),
                //         child: TextFormField(
                //           decoration: InputDecoration(
                //               border: InputBorder.none, hintText: "Buscar..."),
                //         ),
                //       ),
                //       Spacer(),
                //       Icon(
                //         Icons.search_rounded,
                //         size: 23,
                //         color: Color.fromARGB(255, 235, 122, 56), //0xFF4C53A2
                //       )
                //     ],
                //   ),
                // ),

                // TITLE categorias
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Text(
                    "Categorias",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 235, 122, 56), //0xFF4C53A2
                    ),
                  ),
                ),

                // CATEGORIAS
                CategoriesWidget(),

                // TITLE Items
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    "Mas Vendidos",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 235, 122, 56), //0xFF4C53A2
                    ),
                  ),
                ),

                // PRODUCTOS
                ItemsWidget(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: (index) {},
        height: 55,
        color: Color.fromARGB(255, 235, 122, 56), //0xFF4C53A2
        items: [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            CupertinoIcons.cart_fill,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.list,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
