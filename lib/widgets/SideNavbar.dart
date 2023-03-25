import 'package:ecommerce_ui/utils/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SideNavBar extends StatelessWidget {
  const SideNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.3,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Color.fromARGB(255, 235, 122, 56),
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.only(top: 30),
                    // decoration: BoxDecoration(
                    //   color: Colors.blue,
                    // ),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      child: ClipOval(
                        child: Icon(
                          Icons.person,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'a_cuvi',
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'a@gmail.com',
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // UserAccountsDrawerHeader(
          //   accountName: Text('a@gmail.com'),
          //   accountEmail: Text('a@gmail.com'),
          //   currentAccountPicture: CircleAvatar(
          //     backgroundColor: Colors.grey.shade300,
          //     child: ClipOval(
          //       child: Icon(
          //         Icons.person,
          //       ),
          //     ),
          //   ),
          //   decoration: BoxDecoration(
          //     color: Colors.blue,
          //     image: DecorationImage(
          //       image: NetworkImage(
          //           "https://img.freepik.com/free-photo/yellow-watercolor-paper_95678-446.jpg"),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              print('Home');
              Navigator.pushNamed(context, 'home');
            },
          ),
          ListTile(
            leading: Icon(CupertinoIcons.cart_fill),
            title: Text("Carrito"),
            onTap: () {
              print('Favorite');
            },
          ),
          ListTile(
            leading: Icon(Icons.search_rounded),
            title: Text("Buscar"),
            onTap: () {
              print('Favorite');
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Favoritos"),
            onTap: () {
              print('Favorite');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              print('Favorite');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Salir"),
            onTap: () {
              AuthController.instance.logOut();
              print('Salir');
            },
          ),
        ],
      ),
    );
  }
}
