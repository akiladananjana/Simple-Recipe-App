import 'package:flutter/material.dart';
import 'package:second_project/widgets/meal_item.dart';
import '../models/meal_data.dart';

class Favorites extends StatelessWidget {
  final List<Meal> favoriteMeals;
  Favorites(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isNotEmpty) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            affordability: favoriteMeals[index].affordability,
            complexity: favoriteMeals[index].complexity,
            duration: favoriteMeals[index].duration,
            imageUrl: favoriteMeals[index].imageUrl,
          );
        },
        itemCount: favoriteMeals.length,
      );
    } else {
      return Center(child: Text("No Favorites here! Start adding some!"));
    }
  }
}
