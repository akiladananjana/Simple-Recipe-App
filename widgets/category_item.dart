import 'package:flutter/material.dart';
import '../screens/category_meal.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryItem({
    required this.id,
    required this.title,
    required this.color,
  });

  void SelectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMeal.RouteName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        SelectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
            gradient: LinearGradient(colors: [
              color.withOpacity(0.7),
              color,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        padding: const EdgeInsets.all(8),
        child: Text(
          this.title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
