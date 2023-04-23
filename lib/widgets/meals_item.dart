import 'package:flutter/material.dart';
import '../models/meal.dart'; //imported to use ENUM Only otherwise no need
import '../pages/meals_detail_page.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final List<String> ingredients;
  final List<String> steps;

  MealItem({
    required this.ingredients,
    required this.steps,
    required this.id,
    required this.title,
    required this.affordability,
    required this.complexity,
    required this.duration,
    required this.imageUrl,
  });
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple'; //Return in itself acts as Break any code after return is dead code
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get AffordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }

  void changeToMealDetailPage(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealsDetailPage.routeName,
      arguments: {
        'id': id,
        'title': title,
        'steps': steps,
        'ingredients': ingredients
      },
      // MaterialPageRoute(builder: (_) {
      //   return MealsDetailPage();
      // }),
    ); //This 'then' runs when the named page is pushed then closed after that it runs
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => changeToMealDetailPage(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 10,
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                child: Image.network(imageUrl,
                    height: 250, width: double.infinity, fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
              ),
              Positioned(
                //this WIDGET Can be used only inside STACK
                bottom: 10,
                right: 0,
                child: Container(
                  width: 300,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          topLeft: Radius.circular(5))),
                  child: Text(
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                    softWrap: true, //Buetifying argument
                    overflow: TextOverflow.fade, //If overflows then itll fade
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.access_alarm_sharp),
                    SizedBox(
                      width: 4,
                    ),
                    Text('$duration min')
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.work),
                    SizedBox(
                      width: 4,
                    ),
                    Text(complexityText)
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money),
                    SizedBox(
                      width: 4,
                    ),
                    Text(AffordabilityText)
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
