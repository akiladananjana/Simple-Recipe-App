import 'package:flutter/material.dart';
import '../models/meal_data.dart';
import '../dummy_data.dart';

class MealDetail extends StatelessWidget {
  static const String RouteName = "/meal_detail";
  final Function toggleFav;
  List<Meal> favoriteMeals;
  MealDetail(this.toggleFav, this.favoriteMeals);

  bool getMealStatus(String mealId) {
    return favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    final RouteArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    void removeItem(var mealId) {
      Navigator.of(context).pop(mealId);
    }

    final meal_data = DUMMY_MEALS.firstWhere((element) {
      return element.id == RouteArgs['id'];
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(RouteArgs['mealTitle'].toString()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                meal_data.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                "Ingredients",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 2,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.white, Colors.black, Colors.white])),
              ),
            ),
            Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(),
                child: ListView.builder(
                    itemCount: meal_data.ingredients.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text("${index + 1}"),
                        ),
                        title: Text(
                          "${meal_data.ingredients[index]}",
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    })),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                "Steps",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 2,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.white, Colors.black, Colors.white])),
              ),
            ),
            Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(),
                child: ListView.builder(
                    itemCount: meal_data.steps.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Text("${index + 1}"),
                            ),
                            title: Text("${meal_data.steps[index]}"),
                          ),
                          Divider()
                        ],
                      );
                    })),
            SizedBox(
              height: 2,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.white, Colors.black, Colors.white])),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: getMealStatus(meal_data.id)
            ? Icon(Icons.star)
            : Icon(Icons.star_border),
        onPressed: () {
          toggleFav(meal_data.id);
        },
      ),
    );
  }
}
