import 'package:flutter/material.dart';
import 'package:second_project/models/meal_data.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMeal extends StatefulWidget {
  static const RouteName = "/category_meal";
  List<Meal> availableMeals;

  CategoryMeal(this.availableMeals);

  @override
  _CategoryMealState createState() => _CategoryMealState();
}

class _CategoryMealState extends State<CategoryMeal> {
  List<Meal> mealList = [];
  var category_title;
  var loadState = false;

  @override
  void didChangeDependencies() {
    if (loadState == false) {
      final RouteArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;

      category_title = RouteArgs['title'];
      final category_id = RouteArgs['id'];

      mealList = widget.availableMeals.where((item) {
        return item.categories.contains(category_id);
      }).toList();
      loadState = true;
    }

    super.didChangeDependencies();
  }

  void removeItem(String mealId) {
    setState(() {
      mealList.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(category_title.toString()),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: mealList[index].id,
              title: mealList[index].title,
              affordability: mealList[index].affordability,
              complexity: mealList[index].complexity,
              duration: mealList[index].duration,
              imageUrl: mealList[index].imageUrl,
            );
          },
          itemCount: mealList.length,
        ));
  }
}
