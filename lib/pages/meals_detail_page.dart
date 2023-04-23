import 'package:flutter/material.dart';

class MealsDetailPage extends StatelessWidget {
  static const routeName = '/meals-detail-page';
  final Function toggleFav;
  final Function isFav;
  MealsDetailPage(this.toggleFav, this.isFav);

  @override
  Widget build(BuildContext context) {
    final mealinfo =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final mealTitle = mealinfo['title'];
    final mealId = mealinfo['id'];
    final mealSteps = mealinfo['steps'] as List<String>;
    final mealIngredients = mealinfo['ingredients'] as List<String>;

    //WIDGETS
    final Widget listIngredients = Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 200,
      width: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) => Card(
          color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              mealIngredients[index],
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        itemCount: mealIngredients.length,
      ),
    );
    //

    final Widget listSteps = Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(10)),
      height: 350,
      width: 350,
      child: ListView.builder(
        itemBuilder: (ctx, index) => ListTile(
            leading: CircleAvatar(
              child: Text('#${index + 1}'),
            ),
            title: Text(mealSteps[index], style: TextStyle(fontSize: 20))),
        itemCount: mealSteps.length,
      ),
    );

    //
    return Scaffold(
      appBar: AppBar(title: Text('${mealTitle as String} Recipe:')),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                'Ingredients',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              listIngredients,
              SizedBox(
                height: 5,
              ),
              Text('Steps:',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              listSteps
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).canvasColor,
        onPressed: () => toggleFav(mealId),
        child: isFav(mealId)
            ? Icon(
                Icons.favorite,
                size: 40,
                color: Theme.of(context).primaryColor,
              )
            : Icon(
                Icons.favorite_outline,
                size: 40,
                color: Theme.of(context).primaryColor,
              ),
      ),
    );
  }
}
