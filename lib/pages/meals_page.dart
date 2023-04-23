import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meals_item.dart';
import '../models/meal.dart';

class MealsPage extends StatefulWidget {
  static const routeName =
      '/meals-page'; //We use this approach coz its less error safe
  final List<Meal> availableMeal;
  MealsPage(this.availableMeal);
  @override
  State<MealsPage> createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  /*We are using these two variable👇inside Build thats we need to declare them globally.*/
  late String dummy_categoryTitle;
  late List<Meal> displayedMeal;
  @override
  /*We Can't use initState() here because it run way before our state is build and that's why 
  it doesn't have the property of CONTEXT init whereas,
  didChangeDependencies() runs a small moments after our state and context is build 
  hence we can use context inside didChangeDependencies() .
  NOTE1: didChangeDependencies() can run multiple times
         (i.e., Whenever the context Changes, Here ModalRoute changes) 
         but initState() only runs once 
  NOTE2:Context is a STATE property not a BUILD property thats why its available before Build function runs 
  NOTE3: Both of them runs before BUILD */
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    dummy_categoryTitle = routeArgs['title'] as String;
    final dummy_categoryId = routeArgs['id'];
    //Extracting mealsDetails on the basis of DUMMY_CATEGORY ID
    displayedMeal = widget.availableMeal.where((meal) {
      return meal.categories.contains(dummy_categoryId);
    }).toList();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dummy_categoryTitle),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              steps: displayedMeal[index].steps,
              ingredients: displayedMeal[index].ingredients,
              id: displayedMeal[index].id,
              title: displayedMeal[index].title,
              imageUrl: displayedMeal[index].imageUrl,
              affordability: displayedMeal[index].affordability,
              complexity: displayedMeal[index].complexity,
              duration: displayedMeal[index].duration,
            );
          },
          itemCount: displayedMeal.length),
    );
  }
}
