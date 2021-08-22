import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (GridView.count(
        childAspectRatio: 3 / 2,
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        crossAxisCount: 2,
        children: DUMMY_CATEGORIES.map((catData) {
          return CategoryItem(
              id: catData.id, title: catData.title, color: catData.color);
        }).toList(),
      )),
    );
  }
}
