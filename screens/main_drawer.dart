import 'package:flutter/material.dart';
import '../screens/categories.dart';

import 'filters.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget ListTileBuilder(
        String title, IconData icon, VoidCallback PageSelecter) {
      return InkWell(
        splashColor: Colors.grey,
        onTap: PageSelecter,
        child: ListTile(
          leading: Icon(
            icon,
            size: 25,
          ),
          title: Text(
            title,
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    }

    return Drawer(
        child: Container(
      //decoration: BoxDecoration(color: Colors.blue),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 100,
            padding: EdgeInsets.all(20),
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Text(
              "Happy Cooking!",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTileBuilder("Meals", Icons.restaurant,
              () => {Navigator.of(context).pushNamed("/")}),
          ListTileBuilder("Settings", Icons.settings,
              () => {Navigator.of(context).pushNamed(Filters.RouteName)}),
        ],
      ),
    ));
  }
}
