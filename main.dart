import 'package:flutter/material.dart';
import './screens/tab_screen.dart';
import 'models/meal_data.dart';
import 'screens/category_meal.dart';
import 'screens/filters.dart';
import 'screens/meal_detail.dart';
import './dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filterData = {
    'is_gluten': false,
    'is_lactose': false,
    'is_vegitarian': false,
    'is_vegan': false
  };

  List<Meal> availableMeals = DUMMY_MEALS;

  List<Meal> favoriteMeals = [];
  int existingMealId = 0;

  void toggleFav(String mealId) {
    //print("Triggered!");

    existingMealId = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    print(existingMealId);

    if (existingMealId >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingMealId);
      });
    } else {
      setState(() {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }

    print(favoriteMeals);
  }

  void setFilters(Map<String, bool> userSelectedFilterData) {
    filterData = userSelectedFilterData;

    availableMeals = DUMMY_MEALS.where((meal) {
      if (filterData['is_gluten'] == true && !meal.isGlutenFree) {
        return false;
      }
      if (filterData['is_lactose'] == true && !meal.isLactoseFree) {
        return false;
      }
      if (filterData['is_vegitarian'] == true && !meal.isVegetarian) {
        return false;
      }
      if (filterData['is_vegan'] == true && !meal.isVegan) {
        return false;
      }

      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.blueGrey[900],
          accentColor: Colors.amber,
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontSize: 24,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      routes: {
        "/": (context) => TabScreen(favoriteMeals),
        CategoryMeal.RouteName: (context) => CategoryMeal(availableMeals),
        MealDetail.RouteName: (context) => MealDetail(toggleFav, favoriteMeals),
        Filters.RouteName: (context) => Filters(filterData, setFilters),
      },
    );
  }
}
