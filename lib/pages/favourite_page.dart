import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meals_item.dart';

class FavouritePage extends StatelessWidget {
  final List<Meal> favouriteMeal;
  FavouritePage(this.favouriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeal.isEmpty) {
      return Center(
        child: Text('No Favourites YET!',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900,
                fontFamily: 'Robot',
                fontSize: 40)),
      );
    } else {
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              steps: favouriteMeal[index].steps,
              ingredients: favouriteMeal[index].ingredients,
              id: favouriteMeal[index].id,
              title: favouriteMeal[index].title,
              imageUrl: favouriteMeal[index].imageUrl,
              affordability: favouriteMeal[index].affordability,
              complexity: favouriteMeal[index].complexity,
              duration: favouriteMeal[index].duration,
            );
          },
          itemCount: favouriteMeal.length);
    }
  }
}
