import 'package:flutter/material.dart';
import 'package:second_project/screens/meal_detail.dart';
import '../models/meal_data.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    required this.id,
    required this.title,
    required this.complexity,
    required this.affordability,
    required this.duration,
    required this.imageUrl,
  });

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetail.RouteName,
        arguments: {"mealTitle": title, "id": id}).then((value) {
      //deleteItem(value);
    });
  }

  String get getComplexity {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "Unknown";
        break;
    }
  }

  String get getAffordability {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      default:
        return "Unknown";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectMeal(context);
      },
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 4,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.all(10),
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 26),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(children: [
                    Icon(Icons.schedule),
                    SizedBox(
                      width: 5,
                    ),
                    Text("${duration} min")
                  ]),
                  Row(children: [
                    Icon(Icons.work),
                    SizedBox(
                      width: 5,
                    ),
                    Text("${getComplexity}")
                  ]),
                  Row(children: [
                    Icon(Icons.attach_money),
                    SizedBox(
                      width: 5,
                    ),
                    Text("${getAffordability}")
                  ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
