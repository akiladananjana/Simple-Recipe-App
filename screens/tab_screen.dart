import 'package:flutter/material.dart';
import '../models/meal_data.dart';
import './main_drawer.dart';

import 'categories.dart';
import 'favorites.dart';

class TabScreen extends StatefulWidget {
  List<Meal> favoriteMeals;

  TabScreen(this.favoriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map> Pages = [];

  @override
  initState() {
    Pages = [
      {'page': Categories(), 'title': 'Categories'},
      {'page': Favorites(widget.favoriteMeals), 'title': 'Favorites'},
    ];

    super.initState();
  }

  int selectedPageIndex = 0;

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Pages[selectedPageIndex]['title']),
      ),
      body: Pages[selectedPageIndex]['page'],
      drawer: MainDrawer(),
      bottomNavigationBar: (BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: selectedPageIndex,
        onTap: selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorite"),
        ],
      )),
    );
  }
}
